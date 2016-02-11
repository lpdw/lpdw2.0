class AdminV2::ActualitiesController < AdminV2Controller
  before_action :set_actuality, only: [:edit, :update, :delete, :destroy]

  def index
    @actualities = Actuality.all
  end

  def new
    @actuality = Actuality.new
  end

  def create
    @actuality = current_user.actuality.new(actuality_params)
    if @actuality.save
      flash['sucess'] = "Actualité créée"
      redirect_to @actuality
    else
      flash['fail'] = "Erreur de création d'actualité"
      redirect_to new_admin_v2_actuality_path(@actuality)
    end
  end

  def edit
  end

  def update
    if @actuality.update_attributes(actuality_params)
      flash['sucess'] = "Actualité mise à jour"
      redirect_to @actuality
    else
      flash['sucess'] = "Erreur de mise à jour d'actualité"
      redirect_to edit_admin_v2_actuality_path(@actuality)
    end
  end

  def destroy
    if @actuality.destroy
      flash['sucess'] = "Actualité supprimée"
      redirect_to admin_v2_actualities_path
    else
      flash['fail'] = "Erreur de suppression d'actualité"
      redirect_to admin_v2_actualities_path
    end
  end

  private
  def set_actuality
    @actuality = Actuality.find(params[:id])
  end

  def actuality_params
  	params[:actuality].permit(:title, :content)
  end
end