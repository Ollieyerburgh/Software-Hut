class CreateJoinTableResourceTheme < ActiveRecord::Migration[5.1]
  def change
    create_join_table :resources, :themes do |t|
      # t.index [:resource_id, :theme_id]
      # t.index [:theme_id, :resource_id]
    end
  end
end
