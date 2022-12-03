Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/new', to: 'restaurants#new'
  get '/restaurants/:id/edit', to: 'restaurants#update'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/dishes', to: 'dishes#index'
  get '/dishes/:id', to: 'dishes#show'
  get '/restaurants/:id/dishes', to: 'restaurant_dishes#index'
  post '/restaurants', to: 'restaurants#create'
end
