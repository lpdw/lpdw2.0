Rails.application.routes.draw do


  get 'projects/new'

  #devise_for :users, :path => '', :path_names => {sign_in: 'admin/login', sign_out:  'logout', sign_up: 'create'}

devise_for :users, :controllers => {:sessions => "sessions"},
:path => '/admin',
:path_names => {
    :sign_in  => 'login',
    :sign_out => 'logout',
    :sign_up => 'login'
  }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

root 'pages#home'

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

  get '/', :to => 'pages#home'
  get '/actualites', :to => 'pages#news'
  get '/actualites/:id' => 'pages#new'
  get '/actualites/:id' => 'pages#new', :as => 'actuality_show'
  get '/formation', :to => 'pages#formation'
  get '/projets', :to => 'pages#project'
  get '/equipe', :to => 'pages#team'
  get '/ucp', :to => 'pages#ucp'
  get '/informations', :to => 'pages#map'
  get '/postuler', :to => 'pages#apply'
  get '/mentions', :to => 'pages#mentions'
  get '/live', :to => 'pages#live'


  #get 'actualites' => 'news#news'
  #get 'actualites/:id' => 'news#new'
  #get 'venir' => 'venir'



  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
