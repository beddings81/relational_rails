class Restaurant < ApplicationRecord
  has_many :dishes

  def self.ordered
    self.all.order('created_at')
  end
end