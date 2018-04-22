class AddProximityToPreferences < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :proximity, :integer
  end
end
