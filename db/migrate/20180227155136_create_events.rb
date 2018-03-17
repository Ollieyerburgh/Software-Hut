class CreateEvents < ActiveRecord::Migration[5.1]

  def down
    drop_table :events
  end
end
