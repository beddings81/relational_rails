class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :open
      t.integer :rating
      t.string :name
    end
  end
end
