class DishesController < ApplicationController
  def index
    @dishes = Dish.true_only
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    dish = Dish.find(params[:id])
    dish.update(dish_params)
    dish.save

    redirect_to "/dishes/#{dish.id}"
  end

  def destroy
    Dish.destroy(params[:id])
    redirect_to '/dishes'
  end

  private

  def dish_params
    params.permit(:name, :price, :hot, :updated_at)
  end
end