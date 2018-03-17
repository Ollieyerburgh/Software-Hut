class CreateAdviser < ActiveRecord::Migration[5.1]
  def change
    create_table :advisers do |t|
      t.string :college
      t.string :role
    end
  end
end
