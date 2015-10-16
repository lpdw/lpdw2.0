class StudentController < ApplicationController
   # before_action :authenticate_user!, only: [:profil, :sendmail, :edit, :update_user]

  def show
    @graduationYears = UsersInfo.select("DISTINCT graduation_year").order("graduation_year").all
    if request.post?
      if params[:filter] == 'Année en cours'
        redirect_to students_list_path
      else
        redirect_to students_list_by_year_path(params[:filter])
      end
    else
      if(params[:graduation_years] == nil)
        @student = User.students.select {|student| student.users_info.graduation_year == 0}
      else
        @student = User.students.select {|student| student.users_info.graduation_year == params[:graduation_years].to_i}
      end
    end
  end

  def profil
      @student = User.students.find(params[:user_id])
  end

  def sendmail
    if params["contact_email"] != "" and params["contact_object"] != "" and params["contact_message"] != ""
      begin
        user = User.find(params[:contact_user_id])
        Emailer.contact_old_student(params, user.email).deliver
      rescue Exception => e
        flash["error"] = "Pas cool !!"
      end
    else
      flash["error"] = "Vous deviez remplir les champs"
    end
    flash["success"] = "Message envoyé"
    redirect_to students_list_path
  end

  def edit
    @student = current_user
  end

  def update_user

    student_cv                = params[:student_cv]
    student_twitter           = params[:student_twitter]
    student_googleplus        = params[:student_googleplus]
    student_linkin            = params[:student_linkin]
    student_email             = params[:student_email]
    student_current_title     = params[:student_current_title]
    student_current_salary    = params[:student_current_salary]
    student_current_job_desc  = params[:student_current_job_desc]
    student_lp_title          = params[:student_lp_title]
    student_lp_desc           = params[:student_lp_desc]
    student_photo             = params[:student_photo]
    student_lp_salary         = params[:student_lp_salary]
    user_id                   = params[:user_id]

    UsersInfo.find_by(user_id: user_id).update(
        :cv => student_cv,
        :current_job_title        => student_current_title,
        :current_job_desc         => student_current_job_desc,
        :current_average_salary   => student_current_salary,
        :lp_job_title             => student_lp_title,
        :lp_job_desc              => student_lp_desc,
        :lp_average_salary        => student_lp_salary
    )

    User.find(user_id).update(
        :twitter =>student_twitter,
        :googleplus =>student_googleplus,
        :linkin =>student_linkin,
        :email =>student_email,
        :photo =>student_photo
    )
    redirect_to student_profil_path(user_id)
  end

end
