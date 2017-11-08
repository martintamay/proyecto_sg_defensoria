class CreateLawyerActions < ActiveRecord::Migration[5.1]
  def change
    create_table :lawyer_actions do |t|
      t.date :action_date
      t.references :legal_case, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
