class CreateLegalCases < ActiveRecord::Migration[5.1]
  def change
    create_table :legal_cases do |t|
      t.text :entry_form
      t.string :name
      t.references :user, foreign_key: true
      t.references :court, foreign_key: true
      t.references :judge, foreign_key: true
      t.references :suspect, foreign_key: true
      t.references :criminal_record, foreign_key: true
      t.text :comment
      t.string :final_sentence

      t.timestamps
    end
  end
end
