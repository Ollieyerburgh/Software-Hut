class CreateJoinTableUserDelivery < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :deliveries do |t|
      t.index [:user_id, :delivery_id]
      # t.index [:delivery_id, :user_id]
    end
  end
end
