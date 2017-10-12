class CreateJudges < ActiveRecord::Migration[5.1]
  def change
    create_table :judges do |t|
      t.references :court, foreign_key: true
      t.references :entity, foreign_key: true

      t.timestamps
    end
  end
end
