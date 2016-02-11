class ErrorsTipsController < ApplicationController
  before_action :set_tip, only: [:new, :create]

  def new
  end

  def create
    if Emailer.error_tips(errors_tips_params).deliver!
      flash[:success] = "Message envoyé"
    else
      flash[:error] = "Erreur d'envoi"
    end
    redirect_to new_tip_errors_tip_path(@tip)
  end

  private

  def set_tip
    @tip = Tip.find(params[:tip_id])
  end

  def errors_tips_params
    params.permit(:name, :email, :description)
  end
end
