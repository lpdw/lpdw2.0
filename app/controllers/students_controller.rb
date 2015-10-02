class StudentsController < ApplicationController
  def show
    @title_admin = "Utilisateurs"
    @user = User.where("role='applicant'")
  end
end
