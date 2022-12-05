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
    restaurant.update(restaurant_params)
    restaurant.save
    redirect_to "/restaurants/#{restaurant.id}"
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to "/restaurants"
  end

private
  def restaurant_params
    params.permit(:name, :open, :rating, :updated_at)
  end
end