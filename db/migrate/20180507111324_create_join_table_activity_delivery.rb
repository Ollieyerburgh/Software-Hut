class CreateJoinTableActivityDelivery < ActiveRecord::Migration[5.1]
  def change
    create_join_table :activities, :deliveries do |t|
       t.index [:activity_id, :delivery_id]
       t.index [:delivery_id, :activity_id]
    end
  end
end
