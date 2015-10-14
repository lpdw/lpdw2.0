class StudentController < ApplicationController
  def show
    @student = Student.joins("LEFT JOIN users ON users.id = users_infos.user_id").select("*")
  end

  def profil
      @student = Student.joins(:user).joins("LEFT JOIN average_salaries ON average_salaries.id = users_infos.average_salary_id").find(params[:user_id])
  end
end
