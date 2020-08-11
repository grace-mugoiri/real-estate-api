class UsersController < ApplicationController

	def index
		@users = User.all
		if @users
			render json: { users: @users }
		else
			render json: { status: 500, errors: ['no users found']}
		end
  end

	def show
		@user = User.find(params[:id])
		if @user
			render json: {user: @user }
		else
			render json: {status: 500, errors: ['user not found']}
		end
  end

	def create
		@user = User.new(user_params)
		# puts @user
		if @user.save
		# 	# login!
			render json: @user, status: 200
		else
			render json: { error: 'Unable to create user' }, status: 400
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user
			@user.destroy
			render json: {message: 'User deleted'}, status: 200
		else
			render json: {error: 'Unable to delete user!'}, status: 400
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
