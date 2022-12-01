require 'rails_helper'

RSpec.describe "restaurants show page", type: :feature do
  it 'can see the attributes for a restaurant' do
    restaurant = Restaurant.create!(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")
     
    restaurant2 = Restaurant.create!(id: 2, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Eddings Cafe")

    visit "/restaurants/#{restaurant.id}"

    expect(page).to have_content(restaurant.name)
    expect(page).to_not have_content(restaurant2.name)
    expect(page).to have_content(restaurant.id)
    expect(page).to have_content(restaurant.open)
    expect(page).to have_content(restaurant.rating)
    expect(page).to have_content(restaurant.updated_at)
    expect(page).to have_content(restaurant.created_at)
  end

  it 'can see how many dishes a restaurant has' do
    restaurant = Restaurant.create!(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")
     
    restaurant2 = Restaurant.create!(id: 2, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Eddings Cafe")

    visit "/restaurants/#{restaurant.id}"

    expect(page).to have_content(restaurant.dish_count)
  end
end