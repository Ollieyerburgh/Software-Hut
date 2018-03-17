class CreateJoinTableActivityTheme < ActiveRecord::Migration[5.1]
  def change
    create_join_table :activities, :themes do |t|
      t.index [:activity_id, :theme_id]
      #t.index [:theme_id, :activity_id]
    end
  end
end
