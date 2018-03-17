class DropResources < ActiveRecord::Migration[5.1]
  def change
    drop_table :resources
  end
end
