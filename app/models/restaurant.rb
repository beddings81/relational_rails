class Restaurant < ApplicationRecord
  has_many :dishes

  def self.ordered
    self.all.order('created_at desc')
  end

  def dish_count
    dishes.count
  end
end