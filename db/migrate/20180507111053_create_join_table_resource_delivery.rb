class CreateJoinTableResourceDelivery < ActiveRecord::Migration[5.1]
  def change
    create_join_table :resources, :deliveries do |t|
       t.index [:resource_id, :delivery_id]
       t.index [:delivery_id, :resource_id]
    end
  end
end
