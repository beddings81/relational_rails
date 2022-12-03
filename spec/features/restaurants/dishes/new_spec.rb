require 'rails_helper'

RSpec.describe 'restaurant dishes new page' do
   before :each do
    @restaurant = Restaurant.create(open: true, rating: 3, name: "Rocky Top Cafe")
    @restaurant1 = Restaurant.create(open: true, rating: 3, name: "Rookies")
    @pasta = @restaurant.dishes.create!(hot: true, price: 15, name: "Seafood Pasta")
    @sundae = @restaurant.dishes.create!(hot: false, price: 5, name: "Fudge Sundae")
    @pho = @restaurant1.dishes.create!(hot: true, price: 12, name: "Pho")
  end
  
  it 'links to /parents/:parent_id/child_table_name/new' do

    visit "/restaurants/#{@restaurant.id}/dishes"

    click_link('Add Dish')

    expect(current_path).to eq("/restaurants/#{@restaurant.id}/dishes/new")
  end
end