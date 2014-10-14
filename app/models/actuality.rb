class Actuality < ActiveRecord::Base
	belongs_to :user

def create_actuality
	@actuality = Actuality.new
end

	def new
		@actuality = Actuality.new(params[:actuality].permit(:title, :content))
    end
end
