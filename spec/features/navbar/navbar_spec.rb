RSpec.describe 'navbar' do
  before :each do
    @restaurant = Restaurant.create!(id: 1, created_at: DateTime.now,
     updated_at: DateTime.now, open: true, rating: 3, name: "Rocky Top Cafe")
  end

  it 'links to each dishes index page' do
    visit "/restaurants/#{@restaurant.id}/edit"

    click_link('Dishes Index')

    expect(current_path).to eq("/dishes")
  end

  it 'links to the restaurant index page' do
    visit "/restaurants/#{@restaurant.id}"

    click_link('Restaurants Index')

    expect(current_path).to eq("/restaurants")
  end
end
