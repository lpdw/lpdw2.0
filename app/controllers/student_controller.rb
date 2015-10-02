class StudentController < ApplicationController
  def show
    @student = Student.joins("LEFT JOIN users ON users.id = users_infos.user_id").select("*")
  end

  def profil
    # @user = User.find(params[:id], :include => :Users_infos)
    @user = User.find(params[:id], :include => [:users_infos => :current_job_title], :conditions => ['users_infos.user_id = ?', params[:id]])

  end
end
