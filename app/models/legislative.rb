class Legislative < ActiveRecord::Base
  acts_as_followable
  acts_as_votable
  has_many :legislative_attachments
  accepts_nested_attributes_for :legislative_attachments

  FILINGFILTERS = [
    ['Hoy', Date.today],
    ['Una semana' , 1.week.ago],
    ['Quince días' , 15.days.ago],
    ['Veinte días' , 20.days.ago],
    ['Un mes' , 1.month.ago]
  ]
end
