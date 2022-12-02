require 'rails_helper'

RSpec.describe "dishes index page", type: :feature do
  it 'can see all the dishes and their attributes' do
    restaurant = Restaurant.create!(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")

    dish = Dish.create!(id: 1, restaurant_id:1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: true, price: 15, name: "Seafood Pasta")

    dish1 = Dish.create!(id: 2, restaurant_id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: true, price: 25, name: "12oz Ribeye")

    visit "/dishes"

    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish1.name)
  end

  it 'links to the dishes index page' do
    visit "/dishes"

    click_link('Dishes')

    expect(current_path).to eq("/dishes")
  end

  it 'links to the restaurant index page' do
    visit "/dishes"

    click_link('Restaurants')

    expect(current_path).to eq("/restaurants")
  end
end