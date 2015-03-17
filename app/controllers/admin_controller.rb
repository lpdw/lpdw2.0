class AdminController < ApplicationController
  #Before any action just authetificate user
  before_action :authenticate_user!, :is_admin

  # permission restrictions
  def admin_restriction_area
    if @user.role != "admin"
      flash[:error] = "You must be admin to access this section"
      redirect_to admin_path()
    end
  end

  #user Controller

  def create_user
# == Admin restriction == #
admin_restriction_area

    @title_admin = "Utilisateur"
    @user = User.new
  end
  def index
    @title_admin = "Dashboard"
    @users = User.all
    @projects = Project.all
    @alerts = Alert.all
    @applicants = Applicant.all
    @lasts = Applicant.order('id DESC')
  end

  def show_users
# == Admin restriction == #
admin_restriction_area

    @title_admin = "Utilisateurs"
    @users = User.all
  end

  def edit_user
  # == Admin restriction == #
  @user = current_user
  if @user.id.to_i != params[:id].to_i
     admin_restriction_area
     @title_admin = "Utilisateur numéro " + params[:id].to_str
  else
       @title_admin = "Profil"
  end

    @user=User.find(params[:id])
  end

  def update_user
  if @user.id.to_i != params[:id].to_i
    # == Admin restriction == #
    admin_restriction_area
  end
    @title_admin = "Utilisateur"
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user].permit(:email, :password, :password_confirmation, :role, :name, :lastname, :twitter, :description, :photo, :linkin))
      # Handle a successful update.
      flash["sucess"] ="Mis a jour avec succès"
      redirect_to admin_show_users_path
    else
      flash[:error] = @user.errors.messages[:email].to_s + @user.errors.messages[:password].to_s +  @user.errors.messages[:password_confirmation].to_s + @user.errors.messages[:photo].to_s
      redirect_to admin_edit_user_path(@user)
    end
  end

  def delete_user
# == Admin restriction == #
admin_restriction_area

    @user=User.find(params[:id])
    if @user.destroy
      flash["sucess"] ="SUCESS DELETE"
      redirect_to admin_show_users_path()
    else
      flash[:error] =  @user.errors.messages[:email] + @user.errors.messages[:password] +  @user.errors.messages[:password_confirmation] + @user.errors.messages[:photo]
      redirect_to admin_show_users_path()
    end
  end

  def new
# == Admin restriction == #
admin_restriction_area

    @user = User.new(params[:user].permit(:email, :password, :password_confirmation, :role, :name, :lastname))
    if @user.save
      flash["success"] ="User created"
      redirect_to admin_show_users_path()
    else
      flash[:error] =  @user.errors.messages[:email].to_s + @user.errors.messages[:password].to_s +  @user.errors.messages[:password_confirmation].to_s + @user.errors.messages[:photo].to_s
      redirect_to admin_create_user_path()
    end
  end

  def is_admin
    @user = current_user
    if @user.role != "intervenant"
      if @user.role != "admin"
        flash[:error] = "You must be admin to access this section"
        redirect_to root_path # halts request cycle
      end
    end
  end


  # applicants controller
  def show_applicants
    @title_admin = "Candidatures"
    @applicants = Applicant.all
  end

  def show_applicant
    @title_admin = "Voir un étudiant"
    @applicant = Applicant.find(params[:id])
    @cursus = @applicant.cursus
    @application = @applicant.other_application
    @experience = @applicant.professional_experiences
    @projects = @applicant.project_applicants
    @votes = @applicant.votes
    @status = @applicant.applicant_status
    @attachements = @applicant.applicant_attachment
    @is_voter = Vote.where("id_applicant = #{params[:id]} AND id_voter = #{current_user.id}")
  end

  # Options administratives
  def applicant_complete
    @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])
    @status.is_complete = params[:applicant_status][:set]
    if @status.save
      redirect_to admin_show_applicants_path
    end
  end

  def ok_for_interview
      @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])
      @status.ok_for_interview = params[:applicant_status][:set]
      if @status.save
        redirect_to admin_show_applicants_path
      end
  end

  def is_refused
    @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])
    @status.is_refused = params[:applicant_status][:set]
    if @status.save
      redirect_to admin_show_applicants_path
    end
  end
  # Votes
  def user_vote
    @vote = Vote.new(params[:vote].permit(:id_applicant, :id_voter, :value))
    if @vote.save
      redirect_to admin_show_applicant_path(@vote.id_applicant)
    else
      redirect_to admin_show_applicant_path(@vote.id_applicant)
    end
  end

  def user_vote_cancel
    @vote = Vote.where("id_applicant = #{params[:vote][:id_applicant]} AND id_voter = #{params[:vote][:id_voter]}")
    if @vote[0].destroy
      redirect_to admin_show_applicant_path(@vote[0].id_applicant)
    else
      redirect_to admin_show_applicant_path(@vote[0].id_applicant)
    end
  end

  # actuality Controller
  before_action :get_this_actuality,only: [:edit_actuality,:update_actuality,:delete_actuality]
  def get_this_actuality
    @thisActuality = Actuality.find(params[:id])
  end

  def show_actualities

    @title_admin = "Actualités"
    @actualities = Actuality.all
  end
  def create_actuality
    @title_admin = "Actualité"
    @actuality = Actuality.new
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

  def new_actuality
    @title_admin = "Actualité"
    @actuality = Actuality.new(params[:actuality].permit(:title, :content, :author))
    if @actuality.save
      flash["sucess"] = "Actuality created"
      redirect_to admin_show_actualities_path() # halts request cycle
    else
      flash["fail"] = "Actuality not created"
      redirect_to admin_create_actuality_path() # halts request cycle
    end
  end

  def edit_actuality
    @title_admin = "Actualité"
  end
  def update_actuality
    @title_admin = "Actualité"
    if @thisActuality.update_attributes(params[:thisActuality].permit(:title, :content, :author))
      # Handle a successful update.
      flash["sucess"] ="Mis a jour avec succès"
      redirect_to admin_show_actualities_path
    else
      redirect_to admin_edit_actuality_path(thisActuality)
    end
  end
  def delete_actuality
    if @thisActuality.destroy
      flash["sucess"] ="SUCESS DELETE"
      redirect_to admin_show_actualities_path()
    else
      flash["fail"] = "Delete Fail"
      redirect_to admin_show_actualities_path()
    end
  end

  #alert controller
  before_action :get_this_alert,only: [:edit_alert,:update_alert,:delete_alert]
  def get_this_alert
  # == Admin restriction == #
  admin_restriction_area
    @thisAlert = Alert.find(params[:id])
  end

  def create_alert
    @alert = Alert.new
  end

  def new_alert
  # == Admin restriction == #
  admin_restriction_area
    @alert = Alert.new(params[:alert].permit(:name,:content,:level,:active))
    if @alert.save
      flash["sucess"] ="Alert created"
      redirect_to admin_show_alerts_path()
    else
      flash["fail"] = "Fail to create alert"
      redirect_to admin_create_alert_path()
    end
  end
  def show_alerts
  # == Admin restriction == #
  admin_restriction_area
    @title_admin = "Alertes"
    @alerts = Alert.all
  end

  def edit_alert
  # == Admin restriction == #
  admin_restriction_area
    @title_admin = "Alerte"
    @actuality=@thisAlert
  end
def update_alert
# == Admin restriction == #
admin_restriction_area
    @title_admin = "Alerte"
    if @thisAlert.update_attributes(params[:thisAlert].permit(:name,:content,:level,:active))
      # Handle a successful update.
      flash["sucess"] ="Mis a jour avec succès"
      redirect_to admin_show_alerts_path()
    else
      redirect_to admin_edit_alert_path(@thisAlert)
    end
  end
  def delete_alert
  # == Admin restriction == #
  admin_restriction_area
    if @thisAlert.destroy
      flash["sucess"] ="SUCESS DELETE"
      redirect_to admin_show_alerts_path()
    else
      flash["fail"] = "Delete Fail"
      redirect_to admin_show_alerts_path()
    end
  end

  # Projects Controller
  before_action :get_this,only: [:edit_project,:update_project,:delete_project]
  def get_this
    @this = Project.find(params[:id])
  end

  def show_projects
  # == Admin restriction == #
  admin_restriction_area
    @title_admin = "projects"
    @projects = Project.all
  end

  def create_project
  # == Admin restriction == #
  admin_restriction_area
    @title_admin = "projects"
    @project = Project.new
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

  def new_project
  # == Admin restriction == #
  admin_restriction_area
    @title_admin = "Project"
    @project = Project.new(params[:project].permit(:photo, :name, :description, :link, :thumbmail))
    if @project.save
      flash[:info] = "Project created"
      redirect_to admin_show_projects_path() # halts request cycle
    else
      flash[:error] = "Project not created"
      redirect_to admin_create_project_path() # halts request cycle
    end
  end

  def edit_project
  # == Admin restriction == #
  admin_restriction_area
    @title_admin = "Project"
    @project=@this
  end
  def update_project
  # == Admin restriction == #
  admin_restriction_area
    @title_admin = "project"
    if @this.update_attributes(params[:this].permit(:photo, :name, :description, :link, :thumbmail))
      # Handle a successful update.
      flash[:info] ="Mis a jour avec succès"
      redirect_to admin_show_projects_path
    else
      flash[:error] = @this.messages.errors
      redirect_to admin_edit_project_path(this)
    end
  end
  def delete_project
  # == Admin restriction == #
  admin_restriction_area
    if @this.destroy
      flash["sucess"] ="SUCESS DELETE"
      redirect_to admin_show_projects_path()
    else
      flash[:error] = @this.messages.errors
      redirect_to admin_show_projects_path()
    end
  end

  def show_interview
    @title_admin = "Entretien"
    @status_interview = ApplicantStatus.all().where.not('applicant_statuses.interview_date' => nil)
    @status_interview_nil = ApplicantStatus.all().where('applicant_statuses.interview_date' => nil,'applicant_statuses.ok_for_interview' => 1)
  end

  def create_interview

    status = ApplicantStatus.find_by(id_applicant: params[:id_applicant])
    format = "%m/%d/%Y %H:%M %p"
    date_time = params[:interview_date]
    datetime = DateTime.strptime(date_time, format)
    if status.update(interview_date: datetime)
      flash[:info] = "L'entretien a été sauvegardé un mail va être envoyé"
    else
      flash[:error] = "Une erreur s'est produite"
    end

    redirect_to admin_show_interview_path()
  end

end
