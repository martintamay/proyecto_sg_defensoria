class AddUsersReferences < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :users, :entity, foreign_key: true
  end
end
