class AdminV2::TipsController < AdminV2Controller
  before_action :set_tip, only: [:edit, :update, :destroy]

  def index
    @tips = Tip.all
    @categories = Tipcategory.all
  end

  def new
    @tip = Tip.new
    @categories = Tipcategory.all
  end
  def create
    @tip = Tip.new(tip_params)
    if @tip.save
      flash['sucess'] = 'Bon plan créé'
    else
      flash['fail'] = 'Bon plon non créé'
    end
    redirect_to admin_v2_tips_path
  end

  def edit
    @categories = Tipcategory.all
  end

  def update
    @tip.update_attributes(tip_params)
    if @tip.save
      flash['sucess'] = 'Bon plan mis à jour'
      redirect_to admin_v2_tips_path
    else
      flash['fail'] = 'Bon plan non mis à jour'
      redirect_to edit_admin_v2_tip_path(@tip)
    end
  end

  def destroy
    if @tip.destroy
      flash['sucess'] = 'Bon plan supprimé'
      redirect_to admin_v2_tips_path
    else
      flash['fail'] = 'Bon plan non supprimé'
      redirect_to admin_v2_tips_path
    end
  end

  private

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def tip_params
    params[:tip].permit(:title, :description, :category, :end_at, :url, :phone, :address, :map, :email)
  end
end