class CreateReclusions < ActiveRecord::Migration[5.1]
  def change
    create_table :reclusions do |t|
      t.references :suspect, foreign_key: true
      t.string :place
      t.date :date_entry
      t.date :date_out

      t.timestamps
    end
  end
end
