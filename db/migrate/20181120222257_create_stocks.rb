class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :brand
      t.string :category
      t.integer :quantity

      t.timestamps
    end
  end
end
