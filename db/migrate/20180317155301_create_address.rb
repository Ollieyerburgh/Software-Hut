class CreateAddress < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :postcode
      t.string :city
    end
  end
end
