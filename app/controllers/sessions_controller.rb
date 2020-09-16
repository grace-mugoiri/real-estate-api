class SessionsController < ApplicationController

	before_action :authorize_api_request
	skip_before_action :authorize_api_request, only: :create

	def create

		@user = User.find_by(username: session_params[:username])
		if @user && @user.authenticate(session_params[:password])
			render json: { logged_in: true, user: @user }
		else
			render json: { message: 'Wrong credentials'}, status: :unauthorized
		end
	end

	private

	def session_params
		params.permit(:username, :password)
	end
end
