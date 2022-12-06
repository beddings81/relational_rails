class Restaurant < ApplicationRecord
  has_many :dishes, :dependent => :destroy

  def self.ordered
    self.all.order('created_at desc')
  end

  def dish_count
    dishes.count
  end

  def alpha
    dishes.order(:name)
  end
end