class ApplicantsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :create]
  before_action :set_applicant, only: [:edit, :update, :new, :create]
  before_action :redirect_if_applicant, only: [:show, :new]

  def show
  end

  def new
	  @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(applicant_params)

    if @applicant.save
      current_user.update_attributes!(id_applicant: @applicant.id, role: 'applicant')
      redirect_to edit_applicant_path(@applicant)
    else
      flash["error"] = "Erreur d'enregistrement"
      render :new
    end
  end

  def edit
    redirect_to(new_applicant_path) unless @applicant
  end

  def update
    @applicant.update_attributes(applicant_params)
    flash["error"] = "Erreur d'enregistrement" unless @applicant.save

    @applicant.applicant_status.finish! if params[:applicant][:finish]

    redirect_to edit_applicant_path
  end

  private

  def set_applicant
    @applicant = current_user.applicant
  end

  def redirect_if_applicant
    redirect_to(edit_applicant_path) if @applicant
  end

  def applicant_params
    params[:applicant].permit(:english_skill, :after_school, :other_language,:name, :first_name, :zip_code,
                              :city, :home_phone, :private_phone, :email, :step_position,
                              :birth, :birth_place, :nationality, :assurance, :address, :status, :has_connection,
                              :connection_desc, :know_formation, :english_skill, :other_language, :after_school,
                              :ip_address, other_application_attributes: [ :id, :content ],
                              cursus_attributes: [ :id, :graduation, :year, :option, :result, :place, :_destroy],
                              professional_experiences_attributes: [ :id, :year, :company, :role, :skill, :_destroy],
                              project_applicants_attributes: [ :id, :year, :project_type, :content, :_destroy],
                              applicant_attachment_attributes: [:id, :name, :file, :_destroy])
  end
end
