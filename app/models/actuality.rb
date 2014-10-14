class Actuality < ActiveRecord::Base
	belongs_to :user

	def index
		@Actuality = Actuality.all
	end
end
