class AdminV2::ProjectsController < AdminV2Controller

  # Projects Controller
  before_action :get_this,only: [:edit,:update,:destroy]
  def get_this
    @this = Project.find(params[:id])
  end

  def index
    # == Admin restriction == #
    @title_admin = "projets"
    @projects = Project.all
  end

  # def show_projects
  #   # == Admin restriction == #
  #   admin_restriction_area
  #   @title_admin = "projets"
  #   @projects = Project.all
  # end

  def new
    # == Admin restriction == #
    admin_restriction_area
    @title_admin = "projets"
    @project = Project.new
  end
  def create
    # == Admin restriction == #
    admin_restriction_area
    @title_admin = "Projet"
    @project = Project.new(params[:project].permit(:photo, :name, :description, :link, :thumbmail))
    if @project.save
      flash[:info] = "Projet créé"
    else
      flash[:error] = "Erreur de création du projet"
    end
    redirect_to admin_v2_projects_path
  end

  def create_tinymce_assets

    geometry = Paperclip::Geometry.from_file params[:file]
    image    = Image.create params.permit(:file, :alt)

    renderJson = {
        image: {
            url:    image.file.url
        }
    }

    render json: renderJson, content_type: "text/html"
  end



  def edit
    # == Admin restriction == #
    admin_restriction_area
    @title_admin = "Projet"
    @project = @this
  end


  def update
    # == Admin restriction == #
    admin_restriction_area
    @title_admin = "projet"
    if @this.update_attributes(params[:project].permit(:photo, :name, :description, :link, :thumbmail))
      # Handle a successful update.
      flash[:info] ="Mis a jour avec succès"
      redirect_to admin_v2_projects_path
    else
      flash[:error] = @this.messages.errors
      redirect_to edit_admin_v2_project_path(this)
    end
  end

  def destroy
    # == Admin restriction == #
    admin_restriction_area
    # @project = Project.find(params[:id])
    if @this.destroy
      flash["sucess"] ="Projet supprimé"
      redirect_to admin_v2_projects_path
    else
      flash[:error] = @this.messages.errors
      redirect_to admin_v2_projects_path
    end
  end

end