require 'rails_helper'

RSpec.describe "dishes show page", type: :feature do
  it 'can see the attributes for a dish' do
    restaurant = Restaurant.create!(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")

    dish = Dish.create!(id: 1, restaurant_id:1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: true, price: 15, name: "Seafood Pasta")

    dish1 = Dish.create!(id: 2, restaurant_id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: true, price: 25, name: "12oz Ribeye")

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)
    expect(page).to_not have_content(dish1.name)
    end
  end