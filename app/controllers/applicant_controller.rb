class ApplicantController < ApplicationController

  #Post method login
  def applicant_login
      @applicant = Applicant.authenticate(params[:applicant][:email], params[:applicant][:assurance])
      if @applicant
        flash["success"] = "Vous pouvez remplir le dossier"
        redirect_to '/postuler/'+ @applicant.assurance.to_s
      else
        @applicant = nil
        flash["error"] = "Aucune application connue"
        redirect_to :back
      end
  end
  #Postuler
  def apply
    @applicant = Applicant.new
    4.times { @applicant.other_application.build }
  end
  #Post method apply
  def applicant_create_apply
    @applicant = Applicant.find_by_assurance(params[:assurance].to_s)
    if @applicant.blank?
      flash["error"] = "Connectez vous pour modifier votre dossier d'application"
      redirect_to '/postuler'
    else
    end
  end
  def redirect_applicant
    flash["error"] = "Connectez vous pour modifier votre dossier d'application"
    redirect_to '/postuler'
  end
  def create_apply
    @applicant = Applicant.new(params[:applicant].permit(
                                   :deposit_date, :name, :first_name, :zip_code, :city, :home_phone, :private_phone, :email,
                                   :birth, :birth_place, :nationality, :assurance, :address, :status, :has_connection,
                                   :connection_desc, :know_formation, :english_skill, :other_language, :after_school,
                                   :ip_address, :created_at, :updated_at,
                                   other_application_attributes: [:content],
                                   applicant_status_attributes: [:id, :is_finish, :is_complete, :ok_for_interview,
                                                                 :interview_result, :is_refused]
                               ))
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
    @applicant.update(params[:applicant].permit(applicant_statuses: [:id, :is_finish, :is_complete, :ok_for_interview, :interview_result, :is_refused]))
    @applicant.update(params[:applicant].permit(:english_skill, :after_school, :other_language))
    @applicant.update(params[:applicant].permit(cursus_attributes: [ :id, :graduation, :year, :option, :result, :place]))
    @applicant.update(params[:applicant].permit(professional_experiences_attributes: [ :id, :year, :company, :role, :skill]))
    @applicant.update(params[:applicant].permit(project_applicants: [ :id, :year, :project_type, :content]))

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