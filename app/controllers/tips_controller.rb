class TipsController < ApplicationController

  def show

  end

  def index
    @tip = Tip.all
  end

end
