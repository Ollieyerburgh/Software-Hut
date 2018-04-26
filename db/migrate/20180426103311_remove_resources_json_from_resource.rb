class RemoveResourcesJsonFromResource < ActiveRecord::Migration[5.1]
  def change
    remove_column :resources, :resources, :json
  end
end
