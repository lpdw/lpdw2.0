class JobsController < ApplicationController
  before_action :is_admin
  layout "_admin"

  def is_admin
    @user = current_user
    if @user.role != "admin"
      flash[:error] = "You must be admin to access this section"
      redirect_to root_path
    end
  end

  def show_jobs
    @title_admin = "Offre d'emploi"
    @jobs = Job.all
  end

  def create_job
    @title_admin = "Offre d'emploi"
    @job = Job.new
    @companies = Company.all
  end

  def new_job
    @title_admin = "Offre d'emploi"
    @job = Job.new(params[:job].permit(:job_name, :job_number, :job_description, :start_at, :duration, :profil, :contact, :location, :skills))
    @job.company_id = params[:company_id]

    if @job.save
      flash["sucess"] = "Job created"
      redirect_to admin_show_jobs_path
    else
      flash["fail"] = "Job not created"
      redirect_to admin_create_jobs_path
    end
  end

  def edit_job
   @title_admin = "Offre d'emploi"
   @job = Job.find(params[:id]) 
   @companies = Company.all
  end

  def update_job
    @title_admin = "Offre d'emploi"
    @job = Job.find(params[:id])

    if @job.update_attributes(params[:job].permit(:job_name, :job_number, :job_description, :start_at, :duration, :profil, :contact, :location, :skills))
      flash["sucess"] = "Job updated"
      redirect_to admin_show_jobs_path
    else
      redirect_to admin_edit_jobs_path(job)
    end
  end

  def delete_job
    @job = Job.find(params[:id])
    if @job.destroy
      flash["sucess"] = "Job deleted"
      redirect_to admin_show_jobs_path
    else
      flash[:error] = "Job not deleted"
      redirect_to admin_show_jobs_path
    end
  end

end

