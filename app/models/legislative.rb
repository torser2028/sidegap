class Legislative < ActiveRecord::Base
  acts_as_followable
  acts_as_votable

  has_many :attachments
  has_many :comments
  has_many :agendas
  has_many :stories
  has_many :legislative_stakeholders
  has_many :stakeholders, through: :legislative_stakeholders
  has_many :legislatives
  belongs_to :legislative
  
  accepts_nested_attributes_for :attachments, :legislative_stakeholders, :agendas, allow_destroy: true

  default_scope { where(active: true).uniq }
  scope :as_author, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.authors).uniq }
  scope :as_speaker, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.speakers).uniq }
  scope :with_agenda, -> { includes(:agendas).where.not(agendas: { legislative_id: nil }) }


  FILINGFILTERS = [
    ['Hoy', Date.today],
    ['Una semana' , 1.week.ago],
    ['Quince días' , 15.days.ago],
    ['Veinte días' , 20.days.ago],
    ['Un mes' , 1.month.ago]
  ]

  # def inactive!
  #   self.update_attribute(:active, false)
  # end
end
