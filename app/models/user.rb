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
  has_one :users_info, class_name:'UsersInfo', primary_key: 'id', foreign_key: 'user_id', dependent: :destroy
  has_one :applicant, class_name: 'Applicant', primary_key: 'id_applicant', foreign_key: 'id'
  belongs_to :company
  ROLES = %w[admin default intervenant applicant student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :students, -> {where(role: "student")}
  before_create :generate_users_info

  def admin?
    role == 'admin'
  end

  def calcAge
    if self.birth.present?
      today = (Time.new).to_s.split[0]
      res = (today.to_date - (self.birth))/365,25
      @age = res[0].to_i.to_s+' ans'
    else
      @age = 'Non renseigné'
    end
  end


  def generate_users_info
    create_users_info
  end

 def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
  self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end
      
  def display_name
  	if name
      name
    elsif applicant
      applicant.first_name
    else
      email.split('@').first
    end
  end

  def display_role
    case role
    when 'student'
      'Etudiant'
    when 'admin'
      'Administrateur'
    when 'applicant'
      'Candidat'
    when 'intervenant'
      'Intervenant'
    when 'default', nil
      'Défaut'
    end
  end

  def student?
    role == 'student'
  end
 
end
