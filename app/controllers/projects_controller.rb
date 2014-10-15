class ProjectsController < ApplicationController
  
  def new
  	@Projects = Projects.new
  end

  def create_actuality

  end

  def delete_actuality
  	@Projects = projects.find()
  	@Projects.destroy
  end

  def  update_actuality
  	@Projects = projects.find()
  	
  	@Projects.save
  end

end
