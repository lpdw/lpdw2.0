class JobsController < ApplicationController
  before_action :is_student

  def is_student
    @user = current_user
    if @user
      if @user.role != "admin" and @user.role != "applicant"
        flash[:error] = "You must be student to access this section"
        redirect_to root_path
      end
    else
      flash[:error] = "You must be connect to access this section"
      redirect_to root_path
    end
  end

  def job
    @job = Job.find(params["id"])
  end

  def jobs
    @page = params["page"].to_i
    @hasNext = false
    max = Job.count
    limit = 5

    if max > (@page - 1) * limit + limit
      @hasNext = true
    end

    @jobs = Job.limit(limit).offset((@page - 1) * limit).order(created_at: :asc)
    if @jobs.count === 0 and @page > 2
      redirect_to jobs_path(1)
    end
  end

end

