class AddUsersReferences < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :users, :entity, foreign_key: true
  	add_reference :lawyers, :user, foreign_key: true

  	#agregar ref a asistentes
  end
end
