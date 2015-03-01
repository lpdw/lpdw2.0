class ApplicantController < ApplicationController

  #Post method login
  def applicant_login
      @applicant = Applicant.authenticate(params[:applicant][:email], params[:applicant][:assurance])
      if @applicant
        flash["success"] = "Vous pouvez remplir le dossier"
        redirect_to '/postuler/'+ @applicant.assurance.to_s
      else
        @applicant = nil
        flash["error"] = "Aucune application connue"
        redirect_to :back
      end
  end
  #Postuler
  def apply
  end
  #Post method apply
  def applicant_create_apply
    @applicant = Applicant.find_by_assurance(params[:assurance].to_s)
    if (@applicant.blank?)
      flash["error"] = "Connectez vous pour modifier votre dossier d'application"
      redirect_to '/postuler'
    else
    end
  end
  def redirect_applicant
    flash["error"] = "Connectez vous pour modifier votre dossier d'application"
    redirect_to '/postuler'
  end
end