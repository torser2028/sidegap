class User < ActiveRecord::Base
  acts_as_follower
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company

  has_many :assignments
  has_many :roles, through: :assignments

  validates :name, :email, :company, :area, :job, presence: true

  # after_create :send_welcome_email

  def has_role?(role_sym)
    roles.any? { |role| role.name.underscore.to_sym == role_sym }
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end