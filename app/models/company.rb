class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :email_1
  has_many :email_2
  has_many :email_3
  has_many :email_4
  has_many :email_5
  mount_uploader :avatar, AvatarUploader
end
