class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
end
