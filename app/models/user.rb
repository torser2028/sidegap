class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments
  has_many :roles, through: :assignments

  def has_role?(role_sym)
    roles.any? { |role| role.name.underscore.to_sym == role_sym }
  end

end