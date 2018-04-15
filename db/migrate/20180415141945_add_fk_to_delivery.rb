class AddFkToDelivery < ActiveRecord::Migration[5.1]
  def change
    add_reference :deliveries, :preference, foreign_key: true
  end
end
