class Dish < ApplicationRecord
  belongs_to :restaurant

  def self.true_only
    # require 'pry'; binding.pry
    self.all.where(hot: true)
  end
end