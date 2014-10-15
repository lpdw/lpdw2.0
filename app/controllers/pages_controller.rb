class PagesController < ApplicationController
  #Accueil
  def home
     flash[:error] = "You must be admin to access this section"
  end
  #Actualités
  def news
  end
  #Une actualité
  def new
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
  #Contactez-nous
  def contact
  end
end
