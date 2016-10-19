class AdminV2::ApplicantsController < AdminV2Controller
before_action :authenticate_user!, :is_admin

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

  def is_admin
    @user = current_user
    if @user.role != "intervenant"
      if @user.role != "admin"
        flash[:error] = "Vous devez être admin pour accéder à cette section"
        redirect_to root_path # halts request cycle
      end
    end
  end
  
  # Options administratives
  def applicant_complete
    @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])

    @status.is_complete = params[:applicant_status][:set]

    if @status.save
      redirect_to admin_v2_applicants_path
    end
  end
  
  def send_remind
    Emailer.reminder(Applicant.find(params[:applicant][:id])).deliver
    redirect_to admin_v2_applicants_path
  end
  def applicant_finish
    @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])
    @status.is_finish = params[:applicant_status][:set]
    if params[:applicant_status][:set].to_i == 0
      @status.is_complete = 0
    end

    if @status.save
      redirect_to admin_v2_applicants_path
    end
  end

  def ok_for_interview
      @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])
      @status.ok_for_interview = params[:applicant_status][:set]
      if @status.save
        redirect_to admin_v2_applicants_path
      end
  end

  def is_refused
    @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])
    @status.is_refused = params[:applicant_status][:set]
    if @status.save
      redirect_to admin_v2_applicants_path
    end
  end

  def is_accepted
    @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])
    @status.applicant_response = params[:applicant_status][:set]

    if @status.save
      if @status.applicant_response.zero?
        @status.applicant.user.update_attributes!(role: 'applicant')
      else
        @status.applicant.user.update_attributes!(role: 'student', name: @status.applicant.first_name, lastname: @status.applicant.name)
      end
      redirect_to admin_v2_applicants_path
    end
  end

  def interview_result
    @status = ApplicantStatus.find_by(id_applicant: params[:applicant_status][:id_applicant])
    @status.interview_result = params[:applicant_status][:set]
    if @status.save
        redirect_to admin_v2_applicants_path
    end
  end

  def user_destroy
    @applicant = Applicant.find_by(id: params[:applicant_status][:id_applicant])
    if @applicant.delete
            redirect_to admin_v2_applicants_path
    end
  end

  # Votes
  def user_vote
    @vote = Vote.new(params[:vote].permit(:id_applicant, :id_voter, :value))
    if @vote.save
      redirect_to admin_v2_applicants_path(@vote.id_applicant)
    else
      redirect_to admin_v2_applicants_path(@vote.id_applicant)
    end
  end

  def user_vote_cancel
    @vote = Vote.where("id_applicant = #{params[:vote][:id_applicant]} AND id_voter = #{params[:vote][:id_voter]}")
    if @vote[0].destroy
      redirect_to admin_v2_applicants_path(@vote[0].id_applicant)
    else
      redirect_to admin_v2_applicants_path(@vote[0].id_applicant)
    end
  end
  
  private

  def year_params
    year = params[:year].to_i
    year unless year.zero?
  end
end