class CreateSuspects < ActiveRecord::Migration[5.1]
  def change
    create_table :suspects do |t|
      t.string :ci
      t.text :reason
      t.text :mothers_name
      t.text :fathers_name
      t.datetime :birth_date
      t.text :record
      t.string :present_status
      t.string :nationality
      t.text :home_adress
      t.references :entity, foreign_key: true

      t.timestamps
    end
  end
end
