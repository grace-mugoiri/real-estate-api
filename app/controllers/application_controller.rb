class ApplicationController < ActionController::Base

	skip_before_action :verify_authenticity_token

	helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!


	def authorize_api_request
		user = authenticate_with_http_basic { |u, p | User.find_by(username: u)&.authenticate(p)}
		if user
			@current_user = user
		else
			request_http_basic_authentication
		end
	end
	
	def login!
		session[:user_id] = @user.id
	end

	def logged_in?
		!!session[:user_id]
	end

	def current_user
		@current_user
	end

end
