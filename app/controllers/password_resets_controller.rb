class PasswordResetsController < ApplicationController
   def new
    @user = User.new
  end # Here what you missing

  def show
    
  end
  
  def create
  user = User.find_by_email(params[:email])
  user.send_password_reset if user
    flash[:success] = "Un email conmportant les instructions pour la rénitialisation à été envoyé."
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
      elsif @user.update_attributes(params.require(:user).permit(:password, :password_confirmation))
        redirect_to root_url, :notice => "Le mot de passeà bien été changé."
      else
        render :edit
      end
  end
end