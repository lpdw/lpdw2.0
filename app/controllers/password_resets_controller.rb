class PasswordResetsController < ApplicationController
   def new
    #@user = User.new
  end # Here what you missing

  def show
    
  end
  
  def create
      user = User.find_by_email(params[:email])
      user.send_password_reset if user
      redirect_to root_url, :notice => "Email sent with password reset instructions."
  end  
    
  def edit
     @user = User.find_by_password_reset_token!(params[:id])
  end
    
  def update

  @user = User.find_by_password_reset_token!(params[:id])
      if @user.password_reset_sent_at < 2.hours.ago
        redirect_to new_password_reset_path, :alert => "Password &crarr; 
          reset has expired."
      elsif @user.update_attributes(params[:user])
        redirect_to root_url, :notice => "Mot de passe changer."
      else
        render :edit
      end
  end
end