class AdminController < ApplicationController
	#Before any action just authetificate user
	before_action :authenticate_user!, :is_admin


#user Controller
	def create_user
		@user = User.new
	end

	def new
		@user = User.new(params[:user].permit(:email, :password, :password_confirmation, :role))
    end

    def is_admin
    	@user = current_user
    if (@user.role != "admin") then
      flash[:error] = "You must be admin to access this section"
      redirect_to root_path # halts request cycle
    end
  end



# actuality Controller
  def create_actuality
    @actuality = Actuality.new
  end

  def new_actuality
    @actuality = Actuality.new(params[:actuality].permit(:title, :content, :author))
  end
 

# projects Controllers
  def new_projects
    @Projects = Projects.new
  end

  def create_projects
    @Projects = Projects.new(params[:projects].permit(:name))
  end

  def delete_projects
    @Projects = projects.find()
    @Projects.destroy
  end

  def  update_projects
    @Projects = projects.find()
    
    @Projects.save
  end

end
