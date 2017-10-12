class AddUserRefToAssistants < ActiveRecord::Migration[5.1]
  def change
    add_reference :assistants, :user, foreign_key: true
  end
end
