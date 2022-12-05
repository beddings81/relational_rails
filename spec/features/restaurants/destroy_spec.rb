require 'rails_helper'

RSpec.describe "restaurants show page", type: :feature do
  before :each do
    @restaurant = Restaurant.create!(open: true, rating: 3, name: "Rocky Top Cafe")
    @dish = @restaurant.dishes.create!(hot: true, price: 15, name: "Popcorn")
  end

  it 'has a link to delete a restaurant' do
    visit "/restaurants/#{@restaurant.id}"

    click_link("Delete Restaurant")

    expect(current_path).to eq("/restaurants")
    expect(page).to_not have_content('Rocky Top Cafe')

    visit "/dishes"

    expect(page).to_not have_content("Popcorn")
  end

  describe 'restaurants index page' do
    it 'has a link to delete a restaurant' do
      visit "/restaurants"

      click_link("Delete #{@restaurant.name}")

      expect(current_path).to eq("/restaurants")
      expect(page).to_not have_content('Rocky Top Cafe')
    end
  end
end