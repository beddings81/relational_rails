require 'rails_helper'

RSpec.describe "restaurants show page", type: :feature do
  it 'can see the attributes for a restaurant' do
    restaurant = Restaurant.create(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")

    visit "/restaurants/1"

    expect(page).to have_content(restaurant.name)
    end
  end