class StudentController < ApplicationController
  def show
    @graduationYears = Student.select("graduation_year").order("graduation_year").all

    if(params[:user_id] == nil)
      @student = User.students.where("graduation_year=0")
    else
      @student = User.students.where("graduation_year=%s", params[:user_id])
    end
  end

  def profil
      @student = User.students.find_by(params[:user_id])
  end
end
