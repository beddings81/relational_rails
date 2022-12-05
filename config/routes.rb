Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/new', to: 'restaurants#new'
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/dishes', to: 'dishes#index'
  get '/dishes/:id', to: 'dishes#show'
  get '/restaurants/:id/dishes', to: 'restaurant_dishes#index'
  post '/restaurants', to: 'restaurants#create'
  patch '/restaurants/:id', to: 'restaurants#update'
  get '/restaurants/:id/dishes/new', to: 'restaurant_dishes#new'
  post '/restaurants/:id/dishes', to: 'restaurant_dishes#create_dish'
  get 'dishes/:id/edit', to: 'dishes#edit'
  patch '/dishes/:id', to: 'dishes#update'
  get 'restaurants/:id/destroy', to: 'restaurants#destroy'
  get 'dishes/:id/destroy', to: 'dishes#destroy'
end
