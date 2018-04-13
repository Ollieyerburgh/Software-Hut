class RemoveTypeFromPreference < ActiveRecord::Migration[5.1]
  def change
    remove_column :preferences, :type
  end
end
