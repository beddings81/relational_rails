class RestaurantDishesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.in_order
    # if sort
    #   @restaurant = Restaurant.find(params[:id])
    #   @dishes = @restaurant.in_order
    # else
    #   @restaurant = Restaurant.find(params[:id])
    #   @dishes = @restaurant.dishes
    # end
  end

  def new
    @restaurant = Restaurant.find(params[:id])
  end

  def create_dish
    dish = Dish.new({
      name: params[:dish][:name],
      price: params[:dish][:price],
      hot: params[:dish][:hot],
      restaurant_id: params[:dish][:restaurant_id]
    })
    dish.save

    redirect_to "/restaurants/#{dish.restaurant_id}/dishes"
  end

  # def sort
  #   @restaurant = Restaurant.find(params[:id])
  #   @dishes = @restaurant.in_order
  #   # redirect_to "/restaurants/#{@restaurant.id}/dishes"
  # end
end