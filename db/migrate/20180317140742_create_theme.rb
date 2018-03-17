class CreateTheme < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
      t.string :theme_name
    end
  end
end
