class AdminV2::InterviewController < AdminV2Controller

  def index
    @title_admin = "Entretien"
    @status_interview = ApplicantStatus.all().where.not('applicant_statuses.interview_date' => nil)
    @status_interview_nil = ApplicantStatus.all().where('applicant_statuses.interview_date' => nil,'applicant_statuses.ok_for_interview' => true)
  end

  def create
    applicant = Applicant.find(params[:id_applicant])
    status = ApplicantStatus.find_by(id_applicant: params[:id_applicant])
    format = "%m/%d/%Y %H:%M %p"
    date_time = params[:interview_date]
    datetime = DateTime.strptime(date_time, format)
    if status.update(interview_date: datetime)
      begin
        Emailer.send_mail_interview(applicant.email,datetime).deliver
      rescue Exception => e
        flash["error"] = "Une erreur s'est produite : le mail n'est pas envoyé"
        redirect_to admin_v2_interview_index_path()  and return
      end
      flash[:info] = "L'entretien a été sauvegardé : un mail va être envoyé"
    else
      flash[:error] = "Une erreur s'est produite"
    end

    redirect_to admin_v2_interview_index_path()
  end

end