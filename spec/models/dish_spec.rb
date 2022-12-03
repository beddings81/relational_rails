require 'rails_helper'

RSpec.describe Dish, type: :model do
  it {should belong_to :restaurant}

  describe '#true_only' do
    it 'only shows dishes where hot = true' do
      restaurant = Restaurant.create(open: true, rating: 3, name: "Rocky Top Cafe")
      dish1 = restaurant.dishes.create!(hot: true, price: 15, name: "a")
      dish2 = restaurant.dishes.create!(hot: false, price: 15, name: "b")
      dish3 = restaurant.dishes.create!(hot: true, price: 15, name: "c")

      expect(Dish.true_only).to eq([dish1, dish3])
      expect(Dish.true_only.count).to eq(2)
    end

  end
end

# User Story 15, Child Index only shows `true` Records 

# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`