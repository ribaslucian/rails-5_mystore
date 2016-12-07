class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|

      # default fields
      t.string :id_ns, null: false, index: true, limit: 64
      t.belongs_to :entity, foreign_key: true, index: true
      t.timestamps

      t.string :cpf, limit: 14
      t.string :rg, limit: 14
    end
  end
end
