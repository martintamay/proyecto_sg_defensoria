class CreateEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.date :birthdate
      t.string :email
     
      t.timestamps
    end
  end
end
