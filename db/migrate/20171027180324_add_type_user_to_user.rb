class AddTypeUserToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type_user, :string
  end
end
