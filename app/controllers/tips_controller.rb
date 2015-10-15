class TipsController < ApplicationController

  def show
    @tip = Tip.find_by(id: params[:id])
  end

  def index
    @tips = Tip.allfin
  end

end
