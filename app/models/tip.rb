class Tip < ActiveRecord::Base
	belongs_to :user

 	validates :title, :description, :category, presence: true
end

