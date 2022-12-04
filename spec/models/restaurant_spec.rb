require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it {should have_many :dishes}

  describe '#ordered' do
    it 'records are ordered by most recently created first' do
      restaurant = Restaurant.create(id: 1, created_at: DateTime.now - 5.days,
      updated_at: Time.now, open: true, rating: 3, name: "Rocky Top Cafe")

      restaurant1 = Restaurant.create(id: 2, created_at: DateTime.now,
      updated_at: Time.now, open: true, rating: 2.5, name: "Eddings Cafe")

      expect(Restaurant.ordered).to eq([restaurant1, restaurant])
    end
  end

  describe '#dish_count' do
    it 'can count the dishes of a restaurant' do
      restaurant = Restaurant.create(open: true, rating: 3, name: "Rookies")

      pasta = restaurant.dishes.create!(hot: true, price: 15, name: "Seafood Pasta")
      sundae = restaurant.dishes.create!(hot: false, price: 5, name: "Fudge Sundae")
      pho = restaurant.dishes.create!(hot: true, price: 12, name: "Pho")

      expect(restaurant.dish_count).to eq(3)
    end
  end

  describe '#in_order' do
    it 'can list dishes alphabetically' do
      restaurant = Restaurant.create(open: true, rating: 3, name: "Rookies")

      pasta = restaurant.dishes.create!(hot: true, price: 15, name: "Pasta")
      sundae = restaurant.dishes.create!(hot: false, price: 5, name: "Sundae")
      pho = restaurant.dishes.create!(hot: true, price: 12, name: "Pho")

      expect(restaurant.in_order).to eq([pasta, pho, sundae])
    end
  end
end