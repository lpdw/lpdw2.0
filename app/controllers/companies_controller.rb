class CompaniesController < ApplicationController
  before_action :is_student_or_admin

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

