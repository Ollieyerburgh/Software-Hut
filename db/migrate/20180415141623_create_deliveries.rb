class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.string :delivery_method
      t.timestamps
    end
  end
end
