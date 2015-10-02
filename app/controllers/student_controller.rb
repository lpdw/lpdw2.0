class StudentController < ApplicationController
  def show
    @title_admin = "Utilisateurs"
    @student = Student.joins(:user).select("*")
  end
end
