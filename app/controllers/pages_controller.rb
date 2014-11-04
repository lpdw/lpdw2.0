class PagesController < ApplicationController
  #Accueil
  def home
     @actualities = Actuality.all().order(id: :desc).limit(3)
     @alerts= Alert.all()
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
