class Legislative < ActiveRecord::Base
  acts_as_followable
  acts_as_votable

  has_many :attachments
  has_many :legislative_stakeholders
  has_many :legislative_users
  has_many :agendas
  has_many :users, through: :legislative_users
  has_many :stakeholders, through: :legislative_stakeholders
  
  accepts_nested_attributes_for :attachments, :legislative_stakeholders, :agendas, allow_destroy: true

  default_scope { where(active: true) }
  scope :as_author, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.authors).uniq }
  scope :as_speaker, -> { joins(:legislative_stakeholders).merge(LegislativeStakeholder.speakers).uniq }


  FILINGFILTERS = [
    ['Hoy', Date.today],
    ['Una semana' , 1.week.ago],
    ['Quince días' , 15.days.ago],
    ['Veinte días' , 20.days.ago],
    ['Un mes' , 1.month.ago]
  ]

  def inactive!
    self.update_attribute(:active, false)
  end
end
