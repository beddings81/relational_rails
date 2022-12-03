require 'rails_helper'

RSpec.describe "dishes show page", type: :feature do
  before :each do
    @restaurant = Restaurant.create!(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")

    @dish = Dish.create!(id: 1, restaurant_id:1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: true, price: 15, name: "Seafood Pasta")

    @dish1 = Dish.create!(id: 2, restaurant_id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, hot: true, price: 25, name: "12oz Ribeye")
  end

  it 'can see the attributes for a dish' do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.id)
    expect(page).to have_content(@dish.restaurant_id)
    expect(page).to have_content(@dish.price)
    expect(page).to have_content(@dish.hot)
    expect(page).to have_content(@dish.created_at)
    expect(page).to have_content(@dish.updated_at)
    expect(page).to_not have_content(@dish1.name)
    end
  end