class Legislative < ActiveRecord::Base
  acts_as_followable
  acts_as_votable

  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :agendas, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :legislative_stakeholders, dependent: :destroy
  has_many :stakeholders, through: :legislative_stakeholders
  has_many :legislatives, dependent: :destroy
  belongs_to :legislative

  accepts_nested_attributes_for :attachments, :legislative_stakeholders, :agendas, :legislatives, allow_destroy: true

  default_scope { where(active: true).uniq }
  scope :as_author, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.authors).uniq }
  scope :as_speaker, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.speakers).uniq }
  scope :with_agenda, -> { includes(:agendas).where.not(agendas: { legislative_id: nil }) }
  scope :inbox, -> { where.not(final_status: %w(Archivado Retirado Sancionado)) }
  scope :law, -> { where(final_status: 'Sancionado') }
  scope :old, -> { where(final_status: %w(Archivado Retirado)) }

  validates :source, :title, :status, :type_law, :filing_at, presence: true

  FILINGFILTERS = [
    ['Hoy', Date.today],
    ['Una semana' , 1.week.ago],
    ['Quince días' , 15.days.ago],
    ['Veinte días' , 20.days.ago],
    ['Un mes' , 1.month.ago]
  ]

  before_update :update_notification, if: :notify

  # def inactive!
  #   self.update_attribute(:active, false)
  # end

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
end
