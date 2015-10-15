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
	has_many :actuality
  has_one :applicant
  has_one :users_info, class_name:'UsersInfo', primary_key: 'id', foreign_key: 'user_id', dependent: :destroy
  has_one :applicant, class_name: 'Applicant', primary_key: 'id_applicant', foreign_key: 'id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %w[admin default intervenant applicant student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :students, -> {where(role: "student")}

  def admin?
    role == 'admin'
  end

  def calcAge
    if self.birth.present?
      res = ((Time.new) - (self.birth))/60/60/24/365,25
      @age = (res[0].to_i).to_s+' ans'
    else
      @age = 'Non renseigné'
    end
  end
end
