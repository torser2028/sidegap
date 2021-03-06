# coding: utf-8
class Legislative < ActiveRecord::Base
  acts_as_followable
  acts_as_votable

  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :agendas, dependent: :destroy
  has_many :legislative_stakeholders, dependent: :destroy
  has_many :stakeholders, through: :legislative_stakeholders
  has_many :legislatives, dependent: :destroy
  has_many :legislative_statuses, dependent: :destroy
  has_many :legislative_attachment_changes, dependent: :destroy
  has_many :user_followed_legislatives, dependent: :destroy
  belongs_to :legislative

  accepts_nested_attributes_for :attachments, :legislative_stakeholders, :agendas, :legislatives, allow_destroy: true

  default_scope { where(active: true).uniq }
  scope :as_author, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.authors).uniq }
  scope :as_speaker, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.speakers).uniq }
  scope :with_agenda, -> { includes(:agendas, :legislative).where.not(agendas: { legislative_id: nil }).merge(Agenda.active) }
  scope :with_past_agenda, -> { includes(:agendas).where.not(agendas: { legislative_id: nil }).merge(Agenda.past_week) }
  scope :all_with_agenda, -> { includes(:agendas).where.not(agendas: { legislative_id: nil }) }
  scope :inbox, -> { where.not(final_status: %w(Archivado Retirado Sancionado)).includes(:legislative) }
  scope :law, -> { where(final_status: 'Sancionado').includes(:legislative) }
  scope :old, -> { where(final_status: %w(Archivado Retirado)).includes(:legislative) }
  scope :archived, -> { where(final_status: 'Archivado') }
  scope :retired, -> { where(final_status: 'Retirado') }
  scope :with_no_risk, -> { where.not("status = 'Aprobado' OR final_status = 'Archivado'") }

  time_range = ((Time.now.midnight - 7.day)..Time.now.end_of_day - 1.day)

  scope :actual, -> { where(created_at: time_range) }
  scope :actual_archived, -> { where(final_status: 'Archivado', status_updated_at: time_range) }
  scope :actual_retired, -> { where(final_status: 'Retirado', status_updated_at: time_range) }
  scope :actual_status_changed, -> { where.not('status = last_status').where(final_status: ['', nil], status_updated_at: time_range) }

  validates :source, :title, :status, :type_law, :filing_at, presence: true

  FILINGFILTERS = [
    ['Hoy', Date.today],
    ['Una semana' , 1.week.ago],
    ['Quince días' , 15.days.ago],
    ['Veinte días' , 20.days.ago],
    ['Un mes' , 1.month.ago]
  ]

  before_create :set_last_status
  before_update :update_notification, if: :notify
  before_update :store_status_change, :if => :status_changed?
  before_update :track_attachments_changes

  private
    def update_notification
      change_type = if self.probability_changed?
        "Probabilidad"
      elsif self.status_changed? || self.final_status_changed?
        "Estado"
      elsif self.attachments.any? { |a| a.changed? }
        "Archivos Adjuntos"
      end
      UserMailer.set_recipients_project_notification(self, change_type)
      self.update_attribute(:notify, false)
    end

    def set_last_status
      self.last_status = self.status
    end

    def store_status_change
      self.last_status = self.status_was if self.status_changed?
      if self.status != self.status_was || self.final_status != self.final_status_was
        self.status_updated_at = Time.now
      end
      LegislativeStatus.create(legislative: self, last_week_status: status_was, current_status: status, date: DateTime.now)
    end

    def track_attachments_changes
      attachments.each do |attachment|
        if attachment.changed?
          LegislativeAttachmentChange.create(legislative: self, attachment: attachment, date: DateTime.now)
        end
      end
    end
end
