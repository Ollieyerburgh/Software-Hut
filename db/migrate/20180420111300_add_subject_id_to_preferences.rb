class AddSubjectIdToPreferences < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :subject_id, :integer
  end
end
