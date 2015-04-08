class SessionsController < Devise::SessionsController
	# POST /resource/sign_in
	def create
		@user = User.find_for_database_authentication(email:sign_in_params[:email])
		if @user
			if @user.role === "admin" || @user.role === "intervenant"
				self.resource = warden.authenticate!(auth_options)
				set_flash_message(:notice, :signed_in) if is_flashing_format?
				sign_in(resource_name, resource)
				yield resource if block_given?
				respond_with resource, location: after_sign_in_path_for(resource)
			elsif @user.role === "applicant"
        # redirect_to '/postuler/'+ @applicant.assurance.to_s
			end
			else
				flash["error"] = "You must be admin or intervenant to access this section"
				redirect_to :back # halts request cycle
			end
		else
			flash["error"] = "You must be admin or intervenant to access this section"
			redirect_to :back # halts request cycle
		end
	end
end