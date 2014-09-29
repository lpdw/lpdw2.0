class AdminController < ApplicationController
	#Before any action just authetificate user
	before_action :is_admin

		def create_user
		@user = User.new
	end

	def new
		@user = User.new(params[:user].permit(:email, :password, :password_confirmation, :role))
    end

    def is_admin
    	@user = current_user
    if (@user.role != "Admin") then
      flash[:error] = "You must be admin to access this section"
      redirect_to root_path # halts request cycle
    end
  end

end
