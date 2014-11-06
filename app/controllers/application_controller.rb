class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  after_filter :set_access_control_headers
  before_action :set_alerts

  protected

  def layout_by_resource
    if devise_controller? || controller_name == 'admin'
      "_admin"
    else
      "application"
    end
  end

   def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Request-Method'] = '*'
   end
   def set_alerts
    @alerts= Alert.all()
  end

 end