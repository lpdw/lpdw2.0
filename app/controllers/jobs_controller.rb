class JobsController < ApplicationController
  before_action :is_admin
  layout "_admin"

  def is_admin
    @user = current_user
    if @user.role != "admin"
      flash[:error] = "You must be admin to access this section"
      redirect_to root_path
    end
  end

  def show_jobs
    @title_admin = "Offre d'emploi"
    @jobs = Jobs.all
  end

  def create_job
    @title_admin = "Offre d'emploi"
    @job = Jobs.new
  end

  def new_job
    @title_admin = "Offre d'emploi"
    @job = Jobs.new()
  end

  def edit_job
    
  end

  def update_job
    
  end

  def delete_job
    
  end

end

