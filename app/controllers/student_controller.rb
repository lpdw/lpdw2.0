class StudentController < ApplicationController

  def new
    @actuality = Actuality.find(params[:id])
  end
  def edit(id)
    @actuality = Actuality.find(params[:id])
  end
end
