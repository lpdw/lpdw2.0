class AdminV2::TipsController < AdminV2Controller
  before_action :set_tip, only: [:edit, :update, :destroy]

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
    else
      flash['fail'] = 'Tip not created'
    end
    redirect_to admin_v2_tips_path
  end

  def edit
  end

  def update
    @tip.update_attributes(tip_params)
    if @tip.save
      flash['sucess'] = 'Tip updated'
    else
      flash['fail'] = 'Tip not updated'
    end
    redirect_to admin_v2_tips_path
  end

  def destroy
    if @tip.destroy
      flash['sucess'] = 'Tip delete'
      redirect_to admin_v2_tips_path
    else
      flash['fail'] = 'Tip not deleted'
      redirect_to admin_v2_tips_path
    end
  end

  private

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def tip_params
    params[:tip].permit(:title, :description, :category, :end_at, :url, :phone, :address)
  end
end