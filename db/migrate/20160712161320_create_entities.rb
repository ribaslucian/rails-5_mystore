# rails g scaffold Entity name:string documentation:string person:has_one corporate:has_one user:has_one emails:has_many addresses:has_many phones:has_many images:has_many

class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|

      # default fields
      t.string :id_ns, null: false, index: true, limit: 64
      t.timestamps

      t.string :name, limit: 124 # fantasy name for corporations
      t.boolean :is_juridic
    end
  end
end
