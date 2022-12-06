class RestaurantDishesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    if params[:sorted]
      @dishes = @restaurant.alpha
    else
      @dishes = @restaurant.dishes
    end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create_dish
    dish = Dish.new(restaurant_dishes_params)
    dish.save

    redirect_to "/restaurants/#{dish.restaurant_id}/dishes"
  end

private
  def restaurant_dishes_params
    params.permit(:id, :name, :price, :hot, :restaurant_id)
  end
end