class ActualitiesController < ApplicationController

  def index
    @actualities = Actuality.order(:id)
  end

  def show
    @actuality = Actuality.find(params[:id])
  end
end
