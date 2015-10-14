class TipsController < ApplicationController

  def show

  end

  def index
    @tips = Tips.all
  end

end
