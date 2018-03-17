class CreateJoinTableUserTheme < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :themes do |t|
      t.index [:user_id, :theme_id]
      # t.index [:theme_id, :user_id]
    end
  end
end
