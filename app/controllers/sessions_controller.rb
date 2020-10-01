class SessionsController < ApplicationController

	before_action :authorize_api_request
	skip_before_action :authorize_api_request, only: :create

	def create

		@user = User.find_by(username: session_params[:username])
		if @user && @user.authenticate(session_params[:password])
			login!
			render json: { logged_in: true, user: @user }
		else
			render json: { message: 'Wrong credentials'}, status: :unauthorized
		end
	end

	def is_logged_in?
		if logged_in? && current_user
			render json: {logged_in: true, user: current_user }
		else
			render json: { logged_in: false, message: 'no such user'}
		end
	end

	private

	def session_params
		params.permit(:username, :password)
	end
end
