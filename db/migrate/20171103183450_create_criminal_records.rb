class CreateCriminalRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :criminal_records do |t|
      t.string :procedural_stage
      t.string :inquire_number
      t.date :intervention_date
      t.string :type_of_crime
      t.string :commission_place
      t.date :commission_date
      t.string :prosecutor_unit
      t.text :precautionary_measures

      t.timestamps
    end
  end
end
