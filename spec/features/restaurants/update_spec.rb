
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'restaurants update page' do
  before :each do
    @restaurant = Restaurant.create!(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")
  end

  it 'links to a new page from the restaurants show page' do
    visit "/restaurants/#{@restaurant.id}"

    click_link("Update Restaurant")

    expect(current_path).to eq("/restaurants/#{@restaurant.id}/edit")
  end

  it 'can update a restaurant' do
    visit "/restaurants/#{@restaurant.id}/edit"

    fill_in("name", with: "Sydney's Bakery")
    click_button('Update Restaurant')

    expect(current_path).to eq("/restaurants/#{@restaurant.id}")
    expect(page).to have_content("Sydney's Bakery")
  end
end