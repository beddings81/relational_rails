require 'rails_helper'

RSpec.describe "restaurants index page", type: :feature do
  before :each do
    @restaurant = Restaurant.create(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")

    @restaurant1 = Restaurant.create(id: 2, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 2.5, name: "Eddings Cafe")
  end
  it 'can see all restaurant names' do
    visit "/restaurants"

    expect(page).to have_content(@restaurant.name)
    expect(page).to have_content(@restaurant1.name)
  end

  it 'can see the restaurants created at' do
     visit "/restaurants"

     expect(page).to have_content(@restaurant.created_at)
     expect(page).to have_content(@restaurant1.created_at)
  end

  it 'links to edit a restaurant' do
    visit "/restaurants"

    click_link("Update #{@restaurant.name}")
    expect(current_path).to eq("/restaurants/#{@restaurant.id}/edit")
    
    visit "/restaurants"
    click_link("Update #{@restaurant1.name}")
    expect(current_path).to eq("/restaurants/#{@restaurant1.id}/edit")
  end
end