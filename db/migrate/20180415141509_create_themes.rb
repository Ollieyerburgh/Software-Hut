class CreateThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
      t.string :theme_name
      t.timestamps
    end
  end
end
