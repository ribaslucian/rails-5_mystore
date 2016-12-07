class CreateCorporates < ActiveRecord::Migration
  def change
    create_table :corporates do |t|

      # dafault fields
      t.string :id_ns, null: false, index: true, limit: 64
      t.belongs_to :entity, foreign_key: true, index: true
      t.timestamps

      t.string :cnpj, limit: 18
      t.string :corporate_name, limit: 124
      t.string :registration_municipal, limit: 16
      t.string :registration_state, limit: 16
    end
  end
end
