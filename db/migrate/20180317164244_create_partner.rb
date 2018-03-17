class CreatePartner < ActiveRecord::Migration[5.1]
  def change
    create_table :partners do |t|
      t.string :organisation
      t.string :role
    end
  end
end
