class AddPreferenceIdToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :preference_id, :integer
  end
end
