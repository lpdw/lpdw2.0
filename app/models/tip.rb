class Tip < ActiveRecord::Base
	belongs_to :user
	belongs_to :tipcategory

 	validates :title, :description, :category, presence: true
end

