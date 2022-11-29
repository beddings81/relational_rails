require 'rails_helper'

RSpec.describe "restaurants index page", type: :feature do
  it 'can see all restaurant names' do
    restaurant = Restaurant.create(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")

    restaurant1 = Restaurant.create(id: 2, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 2.5, name: "Eddings Cafe")

    visit "/restaurants"

    expect(page).to have_content(restaurant.name)
    expect(page).to have_content(restaurant1.name)
  end




end