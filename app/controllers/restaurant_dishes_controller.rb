class RestaurantDishesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
  end

  def new

  end
end