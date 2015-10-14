class PagesController < ApplicationController
  #Accueil
  def home
     @actualities = Actuality.last(3).reverse
     @projects = Project.last(4).reverse
  end
  #La formation
  def formation
  end
  #Projets étudiants
  def project
    @projects = Project.order(:id)
  end
  #L'équipe
  def team
    @intervenants = User.where(role: 'intervenant')
  end
  #L'ucp
  def ucp
  end
  #Venir à la fac
  def map
  end
  #Mentions
  def mentions
  end
  #réactions et live
  def live
  end

  #Contactez-nous
  def sendmail
    if params["name_contact"] != "" and params["email_contact"] != "" and params["message_contact"] != ""
      begin
        Emailer.contact(params).deliver
      rescue Exception => e
        flash["error"] = "Pas cool !!"
      end
    else
      flash["error"] = "Vous deviez remplir les champs"
    end
    redirect_to informations_path
  end
end
