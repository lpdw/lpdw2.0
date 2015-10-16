class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      flash['sucess'] = "Profil mis à jour"
      redirect_to edit_user_path
    else
      flash['sucess'] = "Erreur d'édition du profil"
      redirect_to edit_user_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :name,
                                 :lastname, :twitter, :description, :photo, :linkin)
  end
end
