class AdminV2::TipsController <  AdminV2Controller

	def index
		@tips = Tip.all
	end

	def new
		@tip = Tip.new
	end

	def create
		@tip = Tip.new(tip_params)
	    if @tip.save
	      flash['sucess'] = 'Tip created'
        redirect_to url_for(:controler => :TipsController, :action => :new)
	    else
	      flash['fail'] = 'Tip not created'
	      redirect_to url_for(:controler => :TipsController, :action => :new)
    	end
	end

	def edit
	end

	def delete
	end

	private

	def tip_params
	  	params[:tip].permit(:title, :description)
  	end
end