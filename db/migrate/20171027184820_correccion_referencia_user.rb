class CorreccionReferenciaUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :user, foreign_key: true
    add_reference :users, :entity, foreign_key: true

  end
end
