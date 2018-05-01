class RemoveFilesFromResources < ActiveRecord::Migration[5.1]
  def change
    remove_column :resources, :files, :json
  end
end
