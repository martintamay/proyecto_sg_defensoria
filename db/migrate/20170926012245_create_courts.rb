class CreateCourts < ActiveRecord::Migration[5.1]
  def change
    create_table :courts do |t|
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
