require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it {should have_many :dishes}

  describe '#ordered' do
    it 'records are ordered by most recently created first' do
      restaurant = Restaurant.create(id: 1, created_at: DateTime.now - 5.days,
      updated_at: Time.now, open: true, rating: 3, name: "Rocky Top Cafe")

      restaurant1 = Restaurant.create(id: 2, created_at: DateTime.now - 2.days,
      updated_at: Time.now, open: true, rating: 2.5, name: "Eddings Cafe")

      expect(Restaurant.ordered).to eq([restaurant, restaurant1])
    end
  end
end