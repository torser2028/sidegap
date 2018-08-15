class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  validates :extra_emails, :format => { :with => /(\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})(,\s*([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,}))*\z)/i }, :allow_blank => true
end
