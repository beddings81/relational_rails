require 'rails_helper'
RSpec.describe 'dishes update page' do
  before :each do
    @restaurant = Restaurant.create(open: true, rating: 3, name: "Rocky Top Cafe")
    @dish = @restaurant.dishes.create!(hot: true, price: 15, name: "Seafood Pasta")
    
  end

  it 'links to a new page from the dishes show page' do
    visit "/dishes/#{@dish.id}"

    click_link('Update Dish')

    expect(current_path).to eq("/dishes/#{@dish.id}/edit")
  end

  it 'can update a dish' do
    visit "dishes/#{@dish.id}/edit"

    fill_in("name", with: "Udon Noodles")
    fill_in("hot", with: "true")
    fill_in("price", with: "12345")
    click_button('Update Dish')

    expect(current_path).to eq("/dishes/#{@dish.id}")
    expect(page).to have_content("Udon Noodles")
    expect(page).to have_content("true")
    expect(page).to have_content("12345")
  end
end
