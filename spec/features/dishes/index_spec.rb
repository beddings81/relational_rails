require 'rails_helper'

RSpec.describe "dishes index page", type: :feature do
  before :each do
    @restaurant = Restaurant.create!(open: true, rating: 3, name: "Rocky Top Cafe")
    @dish = @restaurant.dishes.create!(hot: true, price: 15, name: "Seafood Pasta")
    @dish2 = @restaurant.dishes.create!(hot: true, price: 25, name: "12oz Ribeye")
    @dish3 = @restaurant.dishes.create!(hot: false, price: 25, name: "Im not true")
  end

  it 'can see all the dishes and their attributes' do
    visit "/dishes"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish2.name)
    expect(page).not_to have_content(@dish3.name)
  end

  it 'links to a dishes edit page' do
    visit "/dishes"

    click_link("Update #{@dish.name}")

    expect(current_path).to eq("/dishes/#{@dish.id}/edit")
  end

end