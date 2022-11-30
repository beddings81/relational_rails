# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe "Restaurants dishes index page" do
  it 'shows all the dishes and their attributes for a restaurant' do
    restaurant = Restaurant.create(open: true, rating: 3, name: "Rocky Top Cafe")
    restaurant1 = Restaurant.create(open: true, rating: 3, name: "Rookies")

    pasta = restaurant.dishes.create!(hot: true, price: 15, name: "Seafood Pasta")
    sundae = restaurant.dishes.create!(hot: false, price: 5, name: "Fudge Sundae")
    pho = restaurant1.dishes.create!(hot: true, price: 12, name: "Pho")

    visit "/restaurants/#{restaurant.id}/dishes"

    expect(page).to have_content(pasta.name)
    expect(page).to have_content(pasta.id)
    expect(page).to have_content(pasta.restaurant_id)
    expect(page).to have_content(pasta.price)
    expect(page).to have_content(pasta.hot)
    expect(page).to have_content(pasta.created_at)
    expect(page).to have_content(pasta.updated_at)

    expect(page).to have_content(sundae.name)
    expect(page).to have_content(sundae.id)
    expect(page).to have_content(sundae.restaurant_id)
    expect(page).to have_content(sundae.hot)
    expect(page).to have_content(sundae.created_at)
    expect(page).to have_content(sundae.updated_at)

    expect(page).to_not have_content(pho.name)
  end


end