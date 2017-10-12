class RenameSuspectsRecordColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :suspects, :record, :criminal_record
  end
end
