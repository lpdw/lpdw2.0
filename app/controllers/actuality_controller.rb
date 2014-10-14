class ActualityController < ApplicationController

def create_actuality
	@actuality = Actuality.new
end

def new
	@actuality = Actuality.new(params[:actuality].permit(:title, :content))
end
end
