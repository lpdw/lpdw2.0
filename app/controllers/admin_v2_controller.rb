class AdminV2Controller < ApplicationController
  layout '_admin'

  # permission restrictions
  def admin_restriction_area
    @user = current_user
    if @user.role != "admin"
      flash[:error] = "Vous devez être admin pour accéder à cette section"
      redirect_to admin_path()
    end
  end
  
  before_action :authenticate_user!
  def authorize
    redirect_to(root_path) unless current_user.try(:admin?)
  end

  
end
