class AddThemeIdToPreferences < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :theme_id, :integer
  end
end
