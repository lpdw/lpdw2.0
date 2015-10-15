class TipsController < ApplicationController

    def show
        @tip = Tip.find_by(params[:id])
    end

    def index
        #Permet de récupérer tous les différents types de Tip
        @diff_category = Tip.uniq.pluck(:type)
        @category = params[:category]
        if @category 
            @tips = Tip.where(type: @category)
        else
            @tips = Tip.all
        end
    end

end
