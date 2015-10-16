class CompaniesController < ApplicationController
	before_action :is_student_or_admin

	def annuary
	end

	def company
		@company = Company.find(params["id"])
	end

	def companies
		@pageCurrent = params["page"].to_i
		max = Company.count
		limit = 5
		@pageMax = (max.to_f / limit.to_f).ceil

		@companies = Company.limit(limit).offset((@pageCurrent - 1) * limit).order(name: :asc)

		if @companies.count === 0 and @pageCurrent > 1
			redirect_to companies_path(1)
		end
	end

end

