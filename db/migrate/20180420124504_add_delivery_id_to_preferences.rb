class AddDeliveryIdToPreferences < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :delivery_id, :integer
  end
end
