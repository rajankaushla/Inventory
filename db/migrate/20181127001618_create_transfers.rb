class CreateTransfers < ActiveRecord::Migration[5.0]
  def change
    create_table :transfers do |t|
      t.string :brand
      t.string :category
      t.integer :qunatity
      t.date :transfer_date
      t.string :manager
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
