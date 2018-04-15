class AddFkToTheme < ActiveRecord::Migration[5.1]
  def change
    add_reference :themes, :preference, foreign_key: true
  end
end
