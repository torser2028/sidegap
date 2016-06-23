class Legislative < ActiveRecord::Base
  acts_as_followable
  acts_as_votable

  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :agendas, dependent: :destroy
  has_many :legislative_stakeholders, dependent: :destroy
  has_many :stakeholders, through: :legislative_stakeholders
  has_many :legislatives, dependent: :destroy
  belongs_to :legislative

  accepts_nested_attributes_for :attachments, :legislative_stakeholders, :agendas, :legislatives, allow_destroy: true

  default_scope { where(active: true).uniq }
  scope :as_author, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.authors).uniq }
  scope :as_speaker, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.speakers).uniq }
  scope :with_agenda, -> { includes(:agendas).where.not(agendas: { legislative_id: nil }).merge(Agenda.active) }
  scope :with_past_agenda, -> { includes(:agendas).where.not(agendas: { legislative_id: nil }).merge(Agenda.past_week) }
  scope :all_with_agenda, -> { includes(:agendas).where.not(agendas: { legislative_id: nil }) }
  scope :inbox, -> { where.not(final_status: %w(Archivado Retirado Sancionado)) }
  scope :law, -> { where(final_status: 'Sancionado') }
  scope :old, -> { where(final_status: %w(Archivado Retirado)) }
  scope :archived, -> { where(final_status: 'Archivado') }
  scope :retired, -> { where(final_status: 'Retirado') }

  time_range = ((Time.now - 12.day)..(Time.now - 3.day))
  # time_range = ((Time.now - 7.day)..Time.now.midnight + 1.day)
  status_approved = [
    '1er Debate', '2do Debate', '3er Debate', '4to Debate', 
    '5to Debate', '6to Debate', '7mo Debate', '8vo Debate',
    '1er Ponencia', '2do Ponencia', '3er Ponencia', '4to Ponencia', 
    '5to Ponencia', '6to Ponencia', '7mo Ponencia', '8vo Ponencia',
    'Pendiente Conciliación', 'Ponencia de Comisiones Conjuntas', 'Debate Comisiones Conjuntas', 
    'Ponencia de Plenarias Simultaneas', 'Debate Plenarias Simultaneas'
  ]

  scope :actual, -> { where(created_at: time_range) }
  scope :actual_archived, -> { where(final_status: 'Archivado', status_updated_at: time_range) }
  scope :actual_retired, -> { where(final_status: 'Retirado', status_updated_at: time_range) }
  # scope :actual_approved, -> { where(status: status_approved, final_status: ['', nil], updated_at: time_range) }
  scope :actual_approved, -> { where(final_status: ['', nil], status_updated_at: time_range) }

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
  before_update :update_last_status

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

    def set_last_status
      self.last_status = self.status
    end

    def update_last_status
      self.last_status = self.status_was
      if self.status != self.status_was or self.final_status != ''
        self.status_updated_at = Time.now
      end
    end
end
