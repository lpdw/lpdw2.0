class StudentController < ApplicationController
  def show
    if(params[:user_id] == nil)
      @student = Student.joins("LEFT JOIN users ON users.id = users_infos.user_id").select("*").where("role='student' AND graduation_year=0")
    else
      @student = Student.joins("LEFT JOIN users ON users.id = users_infos.user_id").select("*").where("role='student' AND graduation_year=%s", params[:user_id])
    end
  end

  def profil
      @student = Student.joins(:user).joins("LEFT JOIN average_salaries ON average_salaries.id = users_infos.average_salary_id").where("users.id=%s", params[:user_id])
  end
end
