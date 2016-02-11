class AdminV2::JobsController < AdminV2Controller

	def show_jobs
		@title_admin = "Offre d'emploi"
		@jobs = Job.all
	end

	def create_job
		@title_admin = "Offre d'emploi"
		@job = Job.new
		@job.status = 1
		@companies = Company.all
	end

	def new_job
		@title_admin = "Offre d'emploi"
		@job = Job.new(params[:job].permit(:job_name, :job_number, :job_description, :start_at, :duration, :profil, :contact, :location, :skills, :status))
		@job.company_id = params[:company_id]
	
		if @job.save
			flash["sucess"] = "Offre d'emploi créée"
			redirect_to admin_v2_admin_show_jobs_path
		else
			flash["fail"] = "Erreur de création d'offre d'emploi"
			redirect_to admin_v2_admin_create_job_path
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
		@job.company_id = (params[:company_id] === "0") ? nil : params[:company_id]

		if @job.update_attributes(params[:job].permit(:job_name, :job_number, :job_description, :start_at, :duration, :profil, :contact, :location, :skills, :status))
			flash["sucess"] = "Offre d'emploi mise à jour"
			redirect_to admin_v2_admin_show_jobs_path
		else
			redirect_to admin_v2_admin_edit_jobs_path(job)
		end
	end

	def delete_job
		@job = Job.find(params[:id])
		
		if @job.destroy
			flash["sucess"] = "Offre d'emploi supprimée"
			redirect_to admin_v2_admin_show_jobs_path
		else
			flash[:error] = "Erreur de suppression d'offre d'emploi"
			redirect_to admin_v2_admin_show_jobs_path
		end
	end

	def enable_job
		@job = Job.find(params[:id])
		@job.status = 1
			
		if @job.save
			flash["sucess"] = "Offre d'emploi activée"
			redirect_to admin_v2_admin_show_jobs_path
		else
			flash["fail"] = "Erreur"
			redirect_to admin_v2_admin_show_job_path
		end
	end

	def disable_job
		@job = Job.find(params[:id])
		@job.status = 0
			
		if @job.save
			flash["sucess"] = "Offre d'emploi désactivée"
			redirect_to admin_v2_admin_show_jobs_path
		else
			flash["fail"] = "Erreur"
			redirect_to admin_v2_admin_show_job_path
		end
	end

end

