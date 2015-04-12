class ApplicantController < ApplicationController
  include PagesHelper

  #Post method login
  def applicant_login
    @applicant = Applicant.authenticate(params[:applicant][:email])
    @user = User.find_for_database_authentication(email:params[:applicant][:email])
    self.resource = warden.authenticate!(auth_options)
      if @user
        flash["success"] = "Vous pouvez remplir le dossier"
        #redirect_to '/postuler/'+ @applicant.assurance.to_s
      else
        @applicant = nil
        flash["error"] = "Login ou mot de passe incorrec"
        redirect_to :back
      end
  end
  #Postuler
  def apply
    @applicant = Applicant.new
  end
  #Post method apply
  def applicant_create_apply
    @applicant = Applicant.find_by_assurance(params[:assurance].to_s)
    if @applicant.blank?
      flash["error"] = "Connectez vous pour modifier votre dossier de candidature"
      redirect_to '/postuler'
    else
    end
  end
  def redirect_applicant
    flash["error"] = "Connectez vous pour modifier votre dossier de candidature"
    redirect_to '/postuler'
  end
  def create_apply
    @applicant = Applicant.new(params[:applicant].permit(
                                   :english_skill, :after_school, :other_language,:name, :first_name, :zip_code,
                                   :city, :home_phone, :private_phone, :email, :step_position,
                                   :birth, :birth_place, :nationality, :assurance, :address, :status, :has_connection,
                                   :connection_desc, :know_formation, :english_skill, :other_language, :after_school,
                                   :ip_address, :updated_at,
                                   other_application_attributes: [ :id, :content ],
                                   applicant_status_attributes: [:id, :is_finish, :is_complete, :ok_for_interview, :interview_result, :is_refused],
                                   cursus_attributes: [ :id, :graduation, :year, :option, :result, :place, :_destroy],
                                   professional_experiences_attributes: [ :id, :year, :company, :role, :skill, :_destroy],
                                   project_applicants_attributes: [ :id, :year, :project_type, :content, :_destroy],
                                   applicant_attachments_attributes: [:id, :name, :file, :_destroy]
                               ))
    @autogeneratepwd = Devise.friendly_token.first(8)
    @applicant.create_user(:email => @applicant.email,  :password => @autogeneratepwd, :role => :applicant)
    Emailer.welcome_applicant(@applicant).deliver
    if @applicant.save
      flash["success"] = "Dossier sauvegardé"
      redirect_to '/postuler/'+ @applicant.assurance.to_s
    else
      flash["error"] = "Erreur d'enregistrement"
      redirect_to '/postuler'
    end
  end
  def update_apply
    @applicant = Applicant.find_by_assurance(params[:assurance].to_s)
    if params[:applicant] === nil
      flash["error"] = "Erreur d'enregistrement"
      redirect_to '/postuler'
    end
    @applicant.update(params[:applicant].permit(:english_skill, :after_school, :other_language,:name, :first_name, :zip_code,
                                                :city, :home_phone, :private_phone, :email, :step_position,
                                                :birth, :birth_place, :nationality, :assurance, :address, :status, :has_connection,
                                                :connection_desc, :know_formation, :english_skill, :other_language, :after_school,
                                                :ip_address, :updated_at,
                                                other_application_attributes: [ :id, :content ],
                          applicant_statuses: [:id, :is_finish, :is_complete, :ok_for_interview, :interview_result, :is_refused],
                          cursus_attributes: [ :id, :graduation, :year, :option, :result, :place, :_destroy],
                          professional_experiences_attributes: [ :id, :year, :company, :role, :skill, :_destroy],
                          project_applicants_attributes: [ :id, :year, :project_type, :content, :_destroy],
                          applicant_attachment_attributes: [:id, :name, :file, :_destroy]
                      ))
    #check if applicant send is apply definatly
    if params[:commit] === 'Valider Définitivement'
      @applicant.applicant_status.update_attributes(is_finish: 1, is_complete: 1)
    end
    if @applicant.save
      flash["success"] = "Dossier sauvegardé"
      redirect_to '/postuler/'+ @applicant.assurance.to_s
    else
      flash["error"] = "Erreur d'enregistrement"
      redirect_to '/postuler'
    end
  end
  def update_cursus_apply
    @applicant = Applicant.find_by_assurance(params[:assurance].to_s)
    @cursus = @applicant.cursus.where(id_applicant: @applicant.id, option: params[:applicant][:cursus][], result: @applicant.cursus.year, year: @applicant.cursus.year, place: @applicant.cursus.year).first_or_create
  end
end