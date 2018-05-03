class RemoveCreatedAtFromDeliveries < ActiveRecord::Migration[5.1]
  def change
    remove_column :deliveries, :created_at, :datetime
    remove_column :deliveries, :updated_at, :datetime

  end
end
