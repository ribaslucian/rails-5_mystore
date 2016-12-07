class CreateCategoriesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_products do |t|

      # default fields
      t.timestamps

      t.belongs_to :category, foreign_key: true, index: true
      t.belongs_to :product, foreign_key: true, index: true
    end
  end
end
