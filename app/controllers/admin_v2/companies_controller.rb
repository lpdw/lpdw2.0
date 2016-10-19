class AdminV2::CompaniesController < AdminV2Controller

	def index
		@title_admin = "Entreprises"
		@companies = Company.all
	end

	def new
		@title_admin = "Entreprise"
		@company = Company.new
	end

	def create
		@title_admin = "Entreprise"
		@company = Company.new(params[:company].permit(:name, :description, :address, :zip_code, :city, :phone_number, :website, :twitter, :linkedin))
		
		if @company.save
			flash["sucess"] = "Entreprise créée"
			redirect_to admin_v2_companies_path()
		else
			flash["fail"] = "Erreur de création d'entreprise"
			redirect_to new_admin_v2_company_path()
		end
	end

	def edit
		@title_admin = "Entreprise"    
		@company = Company.find(params[:id])
	end

	def update
		@title_admin = "Entreprise"
		@company = Company.find(params[:id])

		if @company.update_attributes(params[:company].permit(:name, :description, :address, :zip_code, :city, :phone_number, :website, :twitter, :linkedin))
			flash["sucess"] = "Entreprise mise à jour"
			redirect_to admin_v2_companies_path
		else
			redirect_to edit_admin_v2_company_path(company)
		end
	end

	def destroy
		@company = Company.find(params[:id])

		if @company.destroy
			flash["sucess"] = "Entreprise supprimée"
			redirect_to admin_v2_companies_path()
		else
			flash[:error] = "Erreur de suppression d'entreprise"
			redirect_to admin_v2_companies_path()
		end    
	end

end

