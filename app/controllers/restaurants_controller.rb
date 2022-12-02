class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.ordered
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end