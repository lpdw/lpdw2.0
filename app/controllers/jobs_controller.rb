class JobsController < ApplicationController
  before_action :is_student_or_admin
  
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

