require 'rails_helper'

RSpec.describe "dishes show page", type: :feature do
  before :each do
    @restaurant = Restaurant.create!(open: true, rating: 3, name: "Rocky Top Cafe")
    @dish = @restaurant.dishes.create!(hot: true, price: 15, name: "Popcorn")
  end

  it 'has a link to delete a restaurant' do
    visit "/dishes/#{@dish.id}"

    click_link("Delete Dish")

    expect(current_path).to eq("/dishes")
    expect(page).to_not have_content('Popcorn')
  end
end