class CreateJoinTableDeliveryPreference < ActiveRecord::Migration[5.1]
  def change
    create_join_table :deliveries, :preferences do |t|
      # t.index [:delivery_id, :preference_id]
      # t.index [:preference_id, :delivery_id]
    end
  end
end
