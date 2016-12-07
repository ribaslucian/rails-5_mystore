class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|

      # default fields
      t.string :id_ns, null: false, index: true, limit: 64
      t.belongs_to :entity, foreign_key: true, index: true
      t.timestamps

      t.string :phone, null: false, limit: 32
      t.integer :priority, limit: 2, default: 1, null: false
      t.string :description, limit: 256
    end
  end
end
