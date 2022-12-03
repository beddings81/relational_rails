require 'rails_helper'

RSpec.describe "dishes index page", type: :feature do
  it 'can see all the dishes and their attributes' do
    restaurant = Restaurant.create!(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")

    dish = Dish.create!(id: 1, restaurant_id:1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: true, price: 15, name: "Seafood Pasta")

    dish2 = Dish.create!(id: 2, restaurant_id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: true, price: 25, name: "12oz Ribeye")

    dish3 = Dish.create!(id: 3, restaurant_id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: false, price: 25, name: "Im not true")

    visit "/dishes"

    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish2.name)
    expect(page).not_to have_content(dish3.name)
  end
end