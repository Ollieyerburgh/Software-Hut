class RemoveIdFromPreference < ActiveRecord::Migration[5.1]
  def change
    remove_column :preferences, :preference_id
  end
end
