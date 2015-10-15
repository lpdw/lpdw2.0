class ErrorsTipsController < ApplicationController
  def new
  end

  def create
    Emailer.error_tips(errors_tips_params).deliver
  end

  private
  def errors_tips_params
    params.require(:errors_tips).permit(:name, :email, :description)
  end
end
