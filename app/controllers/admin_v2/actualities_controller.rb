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
      flash['sucess'] = 'Actuality created'
      redirect_to @actuality
    else
      flash['fail'] = 'Actuality not created'
      redirect_to new_admin_v2_actuality_path(@actuality)
    end
  end

  def edit
  end

  def update
    if @actuality.update_attributes(actuality_params)
      flash['sucess'] = 'Actuality updated'
      redirect_to @actuality
    else
      flash['sucess'] = 'Actuality not updated'
      redirect_to edit_admin_v2_actuality_path(@actuality)
    end
  end

  def destroy
    if @actuality.destroy
      flash['sucess'] = 'Actuality delete'
      redirect_to admin_v2_actualities_path
    else
      flash['fail'] = 'Actuality not deleted'
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