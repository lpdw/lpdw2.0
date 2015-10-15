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
    @tip = Tip.find(params[:id])
  end

  def update
    @tip = Tip.update_attributes(tip_params)
    if @tip.save
      flash['sucess'] = 'Tip updated'
      redirect_to url_for(:controler => :TipsController, :action => :index)
    else
      flash['fail'] = 'Tip not updated'
      redirect_to url_for(:controler => :TipsController, :action => :index)
    end
  end

	def delete
	end

	private

	def tip_params
	  	params[:tip].permit(:title, :description, :category, :end_at, :url, :phone, :address)
  	end
end