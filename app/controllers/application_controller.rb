class ApplicationController < ActionController::Base
	include Pundit
	protect_from_forgery with: :exception
	after_action :verify_authorized
 	before_action :authenticate_user!
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	# before_action :verify_authorized, except: :index

    before_action :configure_permitted_parameters, if: :devise_controller?

     protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
        end


		def user_not_authorized
			flash[:alert] = "Access denied"
			redirect_to (root_path)
		end

end

