require 'rails_helper'

RSpec.describe "dishes show page", type: :feature do
  before :each do
    @restaurant = Restaurant.create!(open: true, rating: 3, name: "Rocky Top Cafe")
    @dish = @restaurant.dishes.create!(hot: true, price: 15, name: "Popcorn")
  end

  it 'has a button to delete a dish' do
    visit "/dishes/#{@dish.id}"

    click_on "Delete Dish"

    expect(current_path).to eq("/dishes")
    expect(page).to_not have_content('Popcorn')
  end

  describe 'dishes index page' do
    it 'has a button to delete a dish' do
      visit "/dishes"

      click_on "Delete #{@dish.name}"

      expect(current_path).to eq("/dishes")
      expect(page).to_not have_content('Popcorn')
    end
  end
end