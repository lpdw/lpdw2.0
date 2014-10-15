class ProjectsController < ApplicationController
  
  def new_projects
  	@Projects = Projects.new
  end

  def create_projects

  end

  def delete_aprojects
  	@Projects = projects.find()
  	@Projects.destroy
  end

  def  update_projects
  	@Projects = projects.find()
  	
  	@Projects.save
  end

end
