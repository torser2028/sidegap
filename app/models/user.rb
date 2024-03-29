class User < ActiveRecord::Base
  acts_as_follower
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company

  has_many :assignments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_notifications, dependent: :destroy
  has_many :roles, through: :assignments
  has_many :notices
  has_many :user_followed_legislatives, dependent: :destroy

  default_scope { where(active: true) }
  scope :clients, -> { includes(:roles).where(roles: { name: 'client' }) }
  validates :name, :email, :company, :area, :job, presence: true

  after_create :send_welcome_email
  before_save :save_password

  def has_role?(role_sym)
    roles.any? { |role| role.name.underscore.to_sym == role_sym }
  end

  def active!
    self.update_attribute(:active, true)
  end

  def inactive!
    self.update_attribute(:active, false)
  end

  def active_for_authentication?
    super && self.active # i.e. super && self.is_active
  end

  def inactive_message
    I18n.t('devise.failure.user_inactive')
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def save_password
    self.passwd = self.password if self.encrypted_password_changed?
  end
end
