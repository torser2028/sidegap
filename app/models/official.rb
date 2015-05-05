class Official < ActiveRecord::Base
  belongs_to :institution

  mount_uploader :avatar, AvatarUploader
end
