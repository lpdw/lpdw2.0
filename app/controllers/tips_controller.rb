class TipsController < ApplicationController


  def show
    @tip = Tip.find_by(id: params[:id])
  end


  def index
      #Permet de récupérer tous les différents types de Tip
      @diff_category = Tip.uniq.pluck(:category)
      @category = params[:category]
      @search = params[:search]
      
      if @category
          @tips = Tip.where(category: @category)
          @type_error = "category"
      elsif @search
          @tips = Tip.where("title LIKE ? OR description like ?", "%#{@search}%", "%#{@search}%")
          @type_error = "search"
      else
          @tips = Tip.all
      end
  
  end

end
