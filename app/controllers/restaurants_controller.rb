class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.ordered
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new

  end

  def create
    restaurant = Restaurant.create(name: params[:name], open: params[:open], rating: params[:rating])
    redirect_to '/restaurants'
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    restaurant = Restaurant.find(params[:id])
    restaurant.update({
      name: params[:name],
      open: params[:open],
      rating: params[:rating],
      updated_at: Time.now
    })
    restaurant.save
    redirect_to "/restaurants/#{restaurant.id}"
  end
end