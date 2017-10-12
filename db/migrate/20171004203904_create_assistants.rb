class CreateAssistants < ActiveRecord::Migration[5.1]
  def change
    create_table :assistants do |t|
      t.references :lawyer, foreign_key: true
      t.references :entity, foreign_key: true

      t.timestamps
    end
  end
end
