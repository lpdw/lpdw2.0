class AdminV2Controller < ApplicationController
  layout '_admin'
  before_action :authenticate_user!

  def authorize
    redirect_to(root_path) unless current_user.try(:admin?)
  end
end