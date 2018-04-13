class RemoveSubjectIdFromPreference < ActiveRecord::Migration[5.1]
  def change
    remove_column :preferences, :subject_id
  end
end
