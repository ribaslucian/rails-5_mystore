class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

      # default fields
      t.string :id_ns, null: false, index: true, limit: 64
      t.timestamps

      t.string :code, limit: 32, null: false, index: true
      t.string :name, limit: 48, null: false, index: true
      t.decimal :price, precision: 12, scale: 2
      t.decimal :weight, precision: 6, scale: 3
      t.string :warranty, limit: 16
      t.integer :stock
      t.text :description
    end
  end
end
