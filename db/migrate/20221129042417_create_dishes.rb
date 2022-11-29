class CreateDishes < ActiveRecord::Migration[5.2]
  def change
      create_table :dishes do |t|
      t.timestamps
      t.boolean :hot
      t.integer :price
      t.string :name


    end
  end
end
