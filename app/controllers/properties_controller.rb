class PropertiesController < ApplicationController
	before_action :authorize_api_request

	def index
		puts current_user[:email]
		@properties = Property.all
		if @properties
			render json: { properties: @properties }
		else
			render json: { status: 500, errors: ['no properties found']}
		end
	end

	def show
		@property = Property.find(params[:id])
		if @property
			render json: @property
		else
			render json: {error: 'No such property'}, status: 401
		end
	end

	def create
		@property = Property.new(prop_params)
		if @property.save
			render json: @property, status: 200
		else
			render json: {error: 'Unable to create property'}, status: 401
		end
	end

	def destroy
		@property = Property.find(params[:id])
		if @property
			@property.destroy
			render json: {message: 'property deleted'}, status: 200
		else
			render json: {error: 'Unable to delete property!'}, status: 400
		end
	end

	private
	def prop_params
		params.permit(:address, :price, :occupied, :description)
	end

end
