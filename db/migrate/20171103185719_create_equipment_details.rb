class CreateEquipmentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment_details do |t|
      t.references :legal_case, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
