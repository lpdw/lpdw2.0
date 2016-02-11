class AdminV2::TipcategoriesController < AdminV2Controller

  def index
    @categories = Tipcategory.all
  end

  def new
    @category = Tipcategory.new
  end

  def create
    @category = Tipcategory.new(tip_params)
    if @category.save
      flash['sucess'] = 'Categorie créée'
    else
      flash['fail'] = 'Categorie non créée'
    end
    redirect_to admin_v2_tipcategories_path
  end


  def destroy
    @category = Tipcategory.find(params[:id])
    if @category.destroy
      flash['sucess'] = 'Categorie supprimé'
      redirect_to admin_v2_tipcategories_path
    else
      flash['fail'] = 'Categorie non supprimé'
      redirect_to admin_v2_tipcategories_path
    end
  end

  private

  def tip_params
    params[:tipcategory].permit(:title)
  end

end
