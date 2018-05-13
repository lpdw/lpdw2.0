class AdminV2::UsersController < AdminV2Controller
  before_action :set_user, only: [:edit, :update, :delete, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash['sucess'] = "Utilisateur créé"
      redirect_to admin_v2_users_path
    else
      flash['fail'] = "Erreur de création d'utilisateur"
      redirect_to new_admin_v2_user_path(@user)
    end
  end

  def update
    if @user.update_without_password(user_params)
      flash['sucess'] = "Utilisateur mis à jour"
      redirect_to admin_v2_users_path
    else
      flash['sucess'] = "Erreur d'édition de l'utilisateur"
      redirect_to edit_admin_v2_user_path(@user)
    end
  end

  def destroy
    if @user.destroy
      flash['sucess'] = "Utilisateur supprimé"
      redirect_to admin_v2_users_path
    else
      flash['fail'] = "Erreur de suppression de l'utilisateur"
      redirect_to edit_admin_v2_users_path(@user)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    if params[:user][:password].try(:blank?)
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    params.require(:user).permit(:email, :password, :password_confirmation, :role, :name,
                                 :lastname, :twitter, :description, :photo, :linkin, :profile_picture)
  end
end
