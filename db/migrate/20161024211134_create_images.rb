class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|

      # default fields
      t.string :id_ns, null: false, index: true, limit: 64
      t.belongs_to :product, foreign_key: true, index: true
      t.belongs_to :entity, foreign_key: true, index: true
      t.timestamps

      t.attachment :avatar
    end
  end
end
