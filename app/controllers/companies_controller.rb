class CompaniesController < ApplicationController
  before_action :authenticate_user!, :is_admin
  layout "_admin"

  def is_admin
    @user = current_user
    if @user.role != "admin"
      flash[:error] = "You must be admin to access this section"
      redirect_to root_path
    end
  end

  def show_companies
    @title_admin = "Entreprises"
    @companies = Companies.all
  end

  def create_company
    @title_admin = "Entreprise"
    @companies = Companies.new
  end

  def edit_company
  end

  def delete_company
  end

  def show_company
    @title_admin = "Entreprise"
    @company = Companies.find(params[:id])
  end

end

