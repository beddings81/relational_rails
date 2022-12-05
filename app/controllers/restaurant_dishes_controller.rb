class RestaurantDishesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:id])
    if params[:sorted]
      @dishes = @restaurant.in_order
    else
      @dishes = @restaurant.dishes
    end
  end

  def new
    @restaurant = Restaurant.find(params[:id])
  end

  def create_dish
    dish = Dish.new(restaurant_dishes_params)
    dish.save

    redirect_to "/restaurants/#{dish.restaurant_id}/dishes"
  end

private
  def restaurant_dishes_params
    params.require(:dish).permit(:name, :price, :hot, :restaurant_id)
  end
end