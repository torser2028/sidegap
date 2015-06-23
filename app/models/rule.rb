class Rule < ActiveRecord::Base
  acts_as_followable

  belongs_to :institution
  has_many :attachments
  has_many :comments

  accepts_nested_attributes_for :attachments, allow_destroy: true

  scope :deadline_comments, -> { where("deadline_comments < ?", 1.day.from_now) }
end
