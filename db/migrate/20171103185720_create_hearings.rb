class CreateHearings < ActiveRecord::Migration[5.1]
  def change
    create_table :hearings do |t|
      t.date :hearing_date
      t.references :user, foreign_key: true
      t.references :legal_case, foreign_key: true

      t.timestamps
    end
  end
end
