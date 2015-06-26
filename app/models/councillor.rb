class Councillor < ActiveRecord::Base
  has_many :councillor_assignments
  has_many :councils, through: :councillor_assignments

  mount_uploader :avatar, AvatarUploader

  default_scope { order(name: :asc) }
end
