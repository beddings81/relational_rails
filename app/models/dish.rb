class Dish < ApplicationRecord
  belongs_to :restaurant

  def self.true_only
    self.all.where(hot: true)
  end
end