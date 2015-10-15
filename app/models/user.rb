class User < ActiveRecord::Base
 # Include default devise modules. Others available are:
 # :confirmable, :lockable, :timeoutable and :omniauthable
 # validates :password, length: {
 #    minimum: 8,
 #    maximum: 20,
 #    too_short: "must have at least %{count} words",
 #    too_long: "must have at most %{count} words"
 #  }, confirmation: true
  #Link model to Admin
  ROLES = %w[admin default intervenant applicant student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :actuality
  has_one :applicant, class_name: 'Applicant', primary_key: 'id_applicant', foreign_key: 'id'

  def admin?
    role == 'admin'
  end
end
