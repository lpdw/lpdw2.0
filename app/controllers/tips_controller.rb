class TipsController < ApplicationController

  def show

  end

  def index
    @tips = Tip.all
  end

end
