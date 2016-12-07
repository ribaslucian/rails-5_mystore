class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|

      # default fields
      t.string :id_ns, null: false, index: true, limit: 64
      t.timestamps

      t.string :name
      t.string :sufix
      t.text :description
    end
  end
end
