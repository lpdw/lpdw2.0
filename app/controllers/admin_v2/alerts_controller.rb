class AdminV2::AlertsController < AdminV2Controller

    #alert controller
  before_action :get_thisAlert,only: [:edit,:update,:destroy]

  def get_thisAlert
    # == Admin restriction == #
    admin_restriction_area
    @thisAlert = Alert.find(params[:id])
  end

  def new
    @title_admin = "Alertes"
    @alert = Alert.new
  end

  def create
    # == Admin restriction == #
    admin_restriction_area
    @alert = Alert.new(params[:alert].permit(:name,:content,:level,:active))
    if @alert.save
      flash["sucess"] ="Alerte créée"
      redirect_to admin_v2_alerts_path
    else
      flash["fail"] = "Erreur de création d'alerte"
      redirect_to new_admin_v2_alerts_path
    end

  end


  def index
    # == Admin restriction == #
    admin_restriction_area
    @title_admin = "Alertes"
    @alerts = Alert.all
  end

  def edit
    # == Admin restriction == #
    admin_restriction_area
    @title_admin = "Alerte"
    @alert = @thisAlert
  end

  def update
  # == Admin restriction == #
    admin_restriction_area
  #   @title_admin = "Alerte"
    if @thisAlert.update_attributes(params[:alert].permit(:name,:content,:level,:active))
      # Handle a successful update.
      flash["sucess"] ="Mis a jour avec succès"
      redirect_to admin_v2_alerts_path
    else
      flash[:error] = @thisAlert.messages.errors
      redirect_to edit_admin_v2_alert_path(thisAlert)
    end
  end

  def destroy
    # == Admin restriction == #
    # admin_restriction_area
    if @thisAlert.destroy
      flash["sucess"] ="Alerte supprimée"
    else
      flash["fail"] = "Erreur de suppression d'alerte"
    end
    redirect_to admin_v2_alerts_path
  end
end