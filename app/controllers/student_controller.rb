class StudentController < ApplicationController
  def show
    @student = Student.joins("LEFT JOIN users ON users.id = users_infos.user_id").select("*")
  end

  def profil
    @student = Student.joins(:user).where("users.id=%s", params[:user_id])
  end
end
