class CreateTransferCases < ActiveRecord::Migration[5.1]
  def change
    create_table :transfer_cases do |t|
      t.references :user, foreign_key: true
      t.references :legal_case, foreign_key: true
      t.text :comentary
      t.date :date_ttransfer

      t.timestamps
    end
  end
end
