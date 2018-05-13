# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  email                        :string(255)      default(""), not null
#  encrypted_password           :string(255)      default(""), not null
#  reset_password_token         :string(255)
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :string(255)
#  last_sign_in_ip              :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  role                         :string(255)
#  lastname                     :string(255)
#  name                         :string(255)
#  photo                        :string(255)
#  twitter                      :string(255)
#  description                  :string(255)
#  linkin                       :string(255)
#  id_applicant                 :integer
#  facebook                     :string(255)
#  github                       :string(255)
#  googleplus                   :string(255)
#  birth                        :date
#  password_reset_token         :string(255)
#  password_reset_sent_at       :datetime
#  profile_picture_file_name    :string(255)
#  profile_picture_content_type :string(255)
#  profile_picture_file_size    :integer
#  profile_picture_updated_at   :datetime
#

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
  has_attached_file :profile_picture, styles: { medium: "300x300#" }

  has_many :actuality
  has_one :users_info, class_name:'UsersInfo', primary_key: 'id', foreign_key: 'user_id', dependent: :destroy
  has_one :applicant, class_name: 'Applicant', primary_key: 'id_applicant', foreign_key: 'id'
  belongs_to :company
  ROLES = %w[admin default intervenant applicant student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :students, -> {where(role: "student")}
  before_create :generate_users_info

  validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/

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
