require 'rails_helper'

RSpec.describe "Restaurants dishes index page" do
  before :each do
    @restaurant = Restaurant.create(open: true, rating: 3, name: "Rocky Top Cafe")
    @restaurant1 = Restaurant.create(open: true, rating: 3, name: "Rookies")
    @pasta = @restaurant.dishes.create!(hot: true, price: 15, name: "Seafood Pasta")
    @sundae = @restaurant.dishes.create!(hot: false, price: 5, name: "Fudge Sundae")
    @pho = @restaurant1.dishes.create!(hot: true, price: 12, name: "Pho")
  end
  it 'shows all the dishes and their attributes for a restaurant' do
   
    visit "/restaurants/#{@restaurant.id}/dishes"

    expect(page).to have_content(@pasta.name)
    expect(page).to have_content(@pasta.id)
    expect(page).to have_content(@pasta.restaurant_id)
    expect(page).to have_content(@pasta.price)
    expect(page).to have_content(@pasta.hot)
    expect(page).to have_content(@pasta.created_at)
    expect(page).to have_content(@pasta.updated_at)

    expect(page).to have_content(@sundae.name)
    expect(page).to have_content(@sundae.id)
    expect(page).to have_content(@sundae.restaurant_id)
    expect(page).to have_content(@sundae.hot)
    expect(page).to have_content(@sundae.created_at)
    expect(page).to have_content(@sundae.updated_at)

    expect(page).to have_content(@restaurant.name)
    
    expect(page).to_not have_content(@pho.name)
  end

  it 'links to the dishes index page' do
    visit "/restaurants/#{@restaurant.id}/dishes"

    click_link('Dishes')

    expect(current_path).to eq("/dishes")
  end

  it 'links to the restaurant index page' do
    visit "/restaurants/#{@restaurant.id}/dishes"

    click_link('Restaurants')

    expect(current_path).to eq("/restaurants")
  end
end