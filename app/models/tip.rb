class Tip < ActiveRecord::Base
	belongs_to :user

 	validates :title, :description, :type, presence: true
end

