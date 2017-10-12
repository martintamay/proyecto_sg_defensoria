class RemoveEntitiesAtributesFromSuspects < ActiveRecord::Migration[5.1]
  def change
	remove_column :suspects, :birth_date
  end
end
