class Stakeholder < ActiveRecord::Base
  has_many :legislative_stakeholders
  has_many :legislatives, through: :legislative_stakeholders

  mount_uploader :avatar, AvatarUploader
end
