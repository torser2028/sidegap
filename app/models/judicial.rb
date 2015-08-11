class Judicial < ActiveRecord::Base
  acts_as_followable

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
