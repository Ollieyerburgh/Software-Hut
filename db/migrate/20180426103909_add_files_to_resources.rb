class AddFilesToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :files, :json
  end
end
