class FavoritesController < ApplicationController
	before_action :authorize_api_request
	before_action :find_property!

	def index
		return render json: @property.favorites if @property
		render json: {message: 'no favorite record'}, status: :not_found

	end

	def create
		current_user.favorite(@property)
		render json: {message: 'property favorited'}
	end

	def destroy
		current_user.unfavorite(@property)
		render json: {message: 'property unfavorited'}
	end


	private

	def find_property!
		@property = Property.find_by_id(params[:property_id])
	end

end
