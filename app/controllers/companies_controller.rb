class CompaniesController < ApplicationController
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

  def annuary
  end

  def company
    @company = Company.find(params["id"])
  end

  def companies
    @page = params["page"].to_i
    @hasNext = false
    max = Company.count
    limit = 5

    if max > (@page - 1) * limit + limit
      @hasNext = true
    end

    @companies = Company.limit(limit).offset((@page - 1) * limit).order(name: :asc)
    if @companies.count === 0 and @page > 2
      redirect_to companies_path(1)
    end
  end

end

