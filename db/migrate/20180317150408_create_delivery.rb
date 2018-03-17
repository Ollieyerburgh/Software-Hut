class CreateDelivery < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.string :delivery_method
    end
  end
end
