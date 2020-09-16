Rails.application.routes.draw do
#   get 'favorites/create'
#   get 'favorites/destroy'
#   get 'properties/index'
#   get 'properties/show'
#   get 'properties/create'
#   get 'properties/destroy'
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	resources :users, only: [:create, :show, :index, :destroy]
	resources :properties, only: [:create, :show, :index, :destroy] do
		resources :favorites
	end


	post '/login', to: 'sessions#create'
	# delete '/logout', to: 'sessions#destroy'
	# get '/logged_in', to: 'sessions#is_logged_in?'

end
