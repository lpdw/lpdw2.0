class StudentController < ApplicationController
  def show
    @title_admin = "Utilisateurs"
    @student = Student.joins(:user).select("*")
  end

  def profil
    @student = Student.joins(:user).find(params[:user_id])
  end
end
