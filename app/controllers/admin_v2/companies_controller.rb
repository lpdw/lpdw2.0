class AdminV2::CompaniesController < AdminV2Controller

  def show_companies
    @title_admin = "Entreprises"
    @companies = Company.all
  end

  def create_company
    @title_admin = "Entreprise"
    @company = Company.new
  end

  def new_company
    @title_admin = "Entreprise"
    @company = Company.new(params[:company].permit(:name, :description, :address, :zip_code, :city, :phone_number, :website, :twitter, :linkedin))
    if @company.save
      flash["sucess"] = "Entreprise créée"
      redirect_to admin_v2_admin_show_companies_path()
    else
      flash["fail"] = "Erreur de création d'entreprise"
      redirect_to admin_v2_admin_create_company_path()
    end
  end

  def edit_company
    @title_admin = "Entreprise"    
    @company = Company.find(params[:id])
  end

  def update_company
    @title_admin = "Entreprise"
    @company = Company.find(params[:id])

    if @company.update_attributes(params[:company].permit(:name, :description, :address, :zip_code, :city, :phone_number, :website, :twitter, :linkedin))
      flash["sucess"] = "Entreprise mise à jour"
      redirect_to admin_v2_admin_show_companies_path
    else
      redirect_to admin_v2_admin_edit_company_path(company)
    end
  end

  def delete_company
    @company = Company.find(params[:id])
    if @company.destroy
      flash["sucess"] = "Entreprise supprimée"
      redirect_to admin_v2_admin_show_companies_path()
    else
      flash[:error] = "Erreur de suppression d'entreprise"
      redirect_to admin_v2_admin_show_companies_path()
    end    
  end

end

