class AdminV2::AdminController < ApplicationController
before_action :authenticate_user!, :is_admin
  def index
    @title_admin = "Dashboard"
    @users = User.all
    @projects = Project.all
    @alerts = Alert.all
    @applicants = Applicant.all
    @lasts = Applicant.last(5).reverse
  end

  def new
# == Admin restriction == #
admin_restriction_area

    @user = User.new(params[:user].permit(:email, :password, :password_confirmation, :role, :name, :lastname))
    if @user.save
      flash["success"] ="Utilisateur créé"
      redirect_to admin_show_users_path()
    else
      flash[:error] =  @user.errors.messages[:email].to_s + @user.errors.messages[:password].to_s +  @user.errors.messages[:password_confirmation].to_s + @user.errors.messages[:photo].to_s
      redirect_to admin_create_user_path()
    end
  end

    def is_admin
    @user = current_user
    if @user.role != "intervenant"
      if @user.role != "admin"
        flash[:error] = "Vous devez être admin pour accéder à cette section"
        redirect_to root_path # halts request cycle
      end
    end
  end

end
