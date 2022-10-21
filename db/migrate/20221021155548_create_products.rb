class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :brand, null: true, foreign_key: true
      t.string :description
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
