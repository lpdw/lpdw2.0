class JobsController < ApplicationController
	before_action :is_student_or_admin
  
	def job
		@job = Job.find(params["id"])
	end

	def jobs
		@pageCurrent = params["page"].to_i
		max = Job.where(status: 1).count
		limit = 5
		@pageMax = (max.to_f / limit.to_f).ceil

		@jobs = Job.where(status: 1).limit(limit).offset((@pageCurrent - 1) * limit).order(id: :desc)

		if @jobs.count === 0 and @pageCurrent > 1
			redirect_to jobs_path(1)
		end
	end

end

