module ApplicationHelper
  def is_active?(link_path)
    request.fullpath.start_with?(link_path) ? "active" : ""
    
    #Faire un if avec égalité sur l'admin et un test comme déjà fait pour le reste
    #/admin/show_applicants/1   -> /admin/show_applicants
    #/admin/show_applicants/1 -> /admin
  end
end
