class AdminController < ApplicationController
  #Before any action just authetificate user
  before_action :authenticate_user!, :is_admin


  #user Controller
  def create_user
    @title_admin = "Utilisateur"
    @user = User.new
  end
  def index

  end
  def show_users
    @title_admin = "Utilisateurs"
    @users = User.all
  end
  def edit_user
    @title_admin = "Utilisateur"
    @user=User.find(params[:id])
  end
  def update_user
    @title_admin = "Utilisateur"
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user].permit(:email, :password, :password_confirmation, :role))
      # Handle a successful update.
      redirect_to admin_path
    else
      redirect_to admin_edit_user_path(user)
    end
  end
  def delete_user
    @user=User.find(params[:id])
    @user.destroy
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
  before_action :get_this,only: [:edit_actuality,:update_actuality,:delete_actuality]
  def get_this
    @this = Actuality.find(params[:id])
  end

  def show_actualities
    @title_admin = "Actualités"
    @actualities = Actuality.all
  end
  def create_actuality
    @title_admin = "Actualité"
    @actuality = Actuality.new
  end

  def new_actuality
    @title_admin = "Actualité"
    @actuality = Actuality.new(params[:actuality].permit(:title, :content, :author))
  end

  def edit_actuality
    @title_admin = "Actualité"
    @actuality=@this
  end
  def update_actuality
    @title_admin = "Actualité"
    if @this.update_attributes(params[:this].permit(:title, :content, :author))
      # Handle a successful update.
      redirect_to admin_path
    else
      redirect_to admin_edit_actuality_path(this)
    end
  end
  def delete_actuality
    @this.destroy
  end

  #alert controller
  def create_alert
    @alert = Alert.new
  end

  def new_alert
    @alert = Alert.new(params[:Alert].permit(:name,:content,:level,:active))
  end
  def show_alert
    @alerts = Alert.where(active: true)
  end
end
