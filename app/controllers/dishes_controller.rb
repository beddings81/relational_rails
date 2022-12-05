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
    dish.update({
      name: params[:name],
      price: params[:price],
      hot: params[:hot],
      updated_at: Time.now
    })
    dish.save

    redirect_to "/dishes/#{dish.id}"
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to "/dishes"
  end
end