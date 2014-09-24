class AdminController < ApplicationController
		def create_user
		@user = User.new
	end

	def new
		@user = User.new(params[:user].permit(:email, :password, :password_confirmation, :role))
    end
end
