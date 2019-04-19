class ApplicationController < ActionController::Base
	# include Pundit
	# rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	# before_action :verify_authorized, except: :index

	# private

	# 	def user_not_authorized
	# 		flash[:alert] = "Access denied"
	# 		redirect_to (request.reffer || root_path)
	# 	end
end

