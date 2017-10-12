class CreateLawyers < ActiveRecord::Migration[5.1]
  def change
    create_table :lawyers do |t|
      t.string :type_lawyer
      t.references :entity, foreign_key: true

      t.timestamps
    end
  end
end
