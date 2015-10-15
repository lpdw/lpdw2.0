class SessionsController < Devise::SessionsController
	# POST /resource/sign_in
	def create
		@user = User.find_for_database_authentication(email:sign_in_params[:email])

		if @user
			self.resource = warden.authenticate!(auth_options)
			set_flash_message(:notice, :signed_in) if is_flashing_format?
			sign_in(resource_name, resource)
			yield resource if block_given?

			case @user.role
			when 'admin','intervenant'
				redirect_to '/admin'
			when 'default', nil
				redirect_to root_path
			when 'applicant'
				redirect_to edit_applicant_path
			end
		else
			flash["error"] = "You must be admin or intervenant to access this section"
			redirect_to :back # halts request cycle
		end
  end
end
