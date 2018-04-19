class AddTypeToPreference < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :type, :string
  end
end
