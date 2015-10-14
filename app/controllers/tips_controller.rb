class TipsController < ApplicationController

  def show
    @tip = Tip.find_by(params[:id])
  end

  def index
    @tips = Tip.all
  end

end
