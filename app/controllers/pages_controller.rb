class PagesController < ApplicationController
  #Accueil
  def home
     flash[:error] = "You must be admin to access this section"
     @actualities = Actuality.all
  end
  #Actualités
  def news
    @actualities = Actuality.all
  end
  #Une actualité
  def new
    @actuality = Actuality.find(params[:id])
  end
  #La formation
  def formation
  end
  #Projets étudiants
  def project
  end
  #L'équipe
  def team
  end
  #L'ucp
  def ucp
  end
  #Venir à la fac
  def map
  end
  #Postuler
  def apply
  end
  #Mentions
  def mentions
  end
  #Contactez-nous
  def contact
  end
end
