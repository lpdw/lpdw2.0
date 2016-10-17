class AdminV2::ApplicantsController < AdminV2Controller


  def index
    @title_admin = "Candidatures"
    @year = year_params || Time.now.year
    @applicants = Applicant.by_year(@year)
  end

  def show
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

  private

  def year_params
    year = params[:year].to_i
    year unless year.zero?
  end
end