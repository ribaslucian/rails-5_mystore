class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      # default fields
      t.string :id_ns, null: false, index: true, limit: 64
      t.belongs_to :entity, foreign_key: true, index: true
      t.timestamps

      t.integer :priority, limit: 2, default: 1, null: false
      t.string :type, limit: 32    # residencial, apartamento
      t.string :zipcode, limit: 14
      t.string :street, limit: 124
      t.string :neighborhood, limit: 64
      t.integer :number, limit: 8
      t.string :complement, limit: 124
      t.string :city, limit: 64
      t.string :state, limit: 64
      t.string :country, limit: 64

      t.decimal :latitude, precision: 3, scale: 6
      t.decimal :longitude,  precision: 3, scale: 6
    end
  end
end
