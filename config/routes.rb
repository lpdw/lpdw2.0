Rails.application.routes.draw do


  #devise_for :users, :path => '', :path_names => {sign_in: 'admin/login', sign_out:  'logout', sign_up: 'create'}

devise_for :users, :controllers => {:sessions => "sessions"},
:path => '',
:path_names => {
    :sign_in  => 'login',
    :sign_out => 'logout',
    :sign_up => 'login'
  }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

root 'pages#home'

  get 'admin/show_applicants' => 'admin#show_applicants'
  get 'admin/show_applicant/:id' => 'admin#show_applicant', :as => 'admin_show_applicant'

  post 'admin/show_applicants/user_vote' => 'admin#user_vote', :as => 'user_vote'
  post 'admin/show_applicants/user_vote_cancel' => 'admin#user_vote_cancel', :as => 'user_vote_cancel'

  post 'admin/show_applicants/applicant_complete', :to => 'admin#applicant_complete', :as => 'applicant_complete'
  post 'admin/show_applicants/ok_for_interview', :to => 'admin#ok_for_interview', :as => 'ok_for_interview'
  post 'admin/show_applicants/is_refused', :to => 'admin#is_refused', :as => 'is_refused'
  post 'admin/show_applicants/is_accepted', :to => 'admin#is_accepted', :as => 'is_accepted'
  post 'admin/show_applicants/applicant_finish', :to => 'admin#applicant_finish', :as => 'applicant_finish'
  post 'admin/show_applicants/interview_result', :to => 'admin#interview_result', :as => 'interview_result'
  post 'admin/show_applicants/user_destroy', :to => 'admin#user_destroy', :as => 'user_destroy'

  get 'admin' => 'admin#index'
  #Avoid sign_up by devise
  get 'admin/sign_up' => 'admin#index'
  get 'admin/create_user' => 'admin#create_user'
  get 'admin/show_users' => 'admin#show_users'
  get 'admin/edit_user/:id' => 'admin#edit_user' , :as => 'admin_edit_user'
  post 'admin/edit_user/:id' => 'admin#update_user'
  post 'admin/create_user' => 'admin#new'
  get 'admin/delete_user/:id' => 'admin#delete_user', :as => 'admin_delete_user'


  get 'admin/create_actuality' => 'admin#create_actuality'
  post 'admin/create_actuality' => 'admin#new_actuality'
  get 'admin/edit_actuality/:id' => 'admin#edit_actuality', :as => 'admin_edit_actuality'
  get 'admin/show_actualities' => 'admin#show_actualities'
  post 'admin/edit_actuality/:id' => 'admin#update_actuality'
  get 'admin/delete_actuality/:id' => 'admin#delete_actuality', :as => 'admin_delete_actuality'
  post 'admin/tinymce_assets' => 'admin#create_tinymce_assets'

  get 'admin/create_alert' => 'admin#create_alert'
  post 'admin/create_alert' => 'admin#new_alert'
  get 'admin/show_alerts' => 'admin#show_alerts'
  get 'admin/edit_alerts/:id' => 'admin#edit_alert', :as => 'admin_edit_alert'
  post 'admin/edit_alerts/:id' => 'admin#update_alert'
  get 'admin/delete_alerts/:id' => 'admin#delete_alert', :as => 'admin_delete_alert'

  get 'admin/create_project' => 'admin#create_project'
  post 'admin/create_project' => 'admin#new_project'
  get 'admin/edit_project/:id' => 'admin#edit_project', :as => 'admin_edit_project'
  get 'admin/show_projects' => 'admin#show_projects'
  post 'admin/edit_project/:id' => 'admin#update_project'
  get 'admin/delete_project/:id' => 'admin#delete_project', :as => 'admin_delete_project'
  post 'admin/tinymce_assets' => 'admin#create_tinymce_assets'
  post 'admin/show_applicants/send_remind', :to => 'admin#send_remind', :as => 'send_remind'

  get 'admin/show_interview' => 'admin#show_interview'
  post 'admin/create_interview' => 'admin#create_interview'
  get 'admin/show_options' => 'admin#show_options'
  get 'admin/show_options' => 'admin#show_options'
  post 'admin/update_options' => 'admin#update_options'



  get '/', :to => 'pages#home'
  get '/actualites', :to => 'pages#news'
  get '/actualites/:id' => 'pages#new'
  get '/actualites/:id' => 'pages#new', :as => 'actuality_show'
  get '/formation', :to => 'pages#formation'
  get '/projets', :to => 'pages#project'
  get '/equipe', :to => 'pages#team'
  get '/ucp', :to => 'pages#ucp'
  get '/informations', :to => 'pages#map'
  post '/informations/sendmail', :to => 'pages#sendmail'
  get '/postuler', :to => 'applicant#apply'
  post '/postuler/login', :to => 'applicant#applicant_login', :as => 'applicant_login'
  get '/postuler/:assurance', :to => 'applicant#applicant_create_apply', :as => 'applicant_create_apply'
  post '/postuler/new', :to => 'applicant#create_apply', :as => 'create_apply'
  patch '/postuler/:assurance', :to => 'applicant#update_apply', :as => 'update_apply'
  get '/mentions', :to => 'pages#mentions'
  get '/live', :to => 'pages#live'
  get '/studentsbook', :to => 'students#show'
  get '/studentprofil', :to => 'student#profil'
end
