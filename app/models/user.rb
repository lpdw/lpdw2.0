class User < ActiveRecord::Base
  #Link model to Admin
	has_many :actuality

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    ROLES = %w[admin default]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
