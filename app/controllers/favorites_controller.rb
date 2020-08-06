class FavoritesController < ApplicationController
	before_action :find_property!
	def create
		current_user.favorite(@property)
			render json: {message: 'property favorited'}
		puts @property
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
