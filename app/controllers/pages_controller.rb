class PagesController < ApplicationController
  #Accueil
  def home
     @actualities = Actuality.all().order(id: :desc).limit(3)
     @projects = Project.all().order(id: :desc).limit(4)
  end
  #Actualités
  def news
    @actualities = Actuality.all().order(id: :desc)
  end
  #Une actualité
  def new
    @actuality = Actuality.find(params[:id])
  end
  def show_new(id)
    @actuality = Actuality.find(params[:id])
  end
  #La formation
  def formation
  end
  #Projets étudiants
  def project
    @projects = Project.all().order(id: :desc)
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
  #Contactez-nous
  def contact
  end
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
  #réactions et live
  def live
  end
end
