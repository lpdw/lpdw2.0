class User < ActiveRecord::Base
	# validates :password, length: {
 #    minimum: 8,
 #    maximum: 20,
 #    too_short: "must have at least %{count} words",
 #    too_long: "must have at most %{count} words"
 #  }, confirmation: true
  #Link model to Admin
	has_many :actuality
  has_one :applicant

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %w[admin default intervenant applicant]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end
end
