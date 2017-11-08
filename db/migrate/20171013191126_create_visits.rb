class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :suspect, foreign_key: true
      t.string :name_visit
      t.date :date_visit
      t.string :observation

      t.timestamps
    end
  end
end
