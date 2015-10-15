class TipsController < ApplicationController

  def show
    @tip = Tip.find(params[:id])
  end

  def index
    @tips = Tip.all
  end

end
