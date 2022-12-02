require 'rails_helper'

RSpec.describe 'the Restaurant creation' do
  it 'links to the new page from the restaurants index' do   
    visit '/restaurants'

    click_link('New Restaurant')

    expect(current_path).to eq('/restaurants/new')
  end

  it 'can create a new restaurant' do
    visit '/restaurants/new'

    fill_in("name", with: "Sydney's Bakery")
    click_button('Create Restaurant')

    expect(current_path).to eq('/restaurants')
    expect(page).to have_content("Sydney's Bakery")
  end
end