class CreateJoinTableThemePreference < ActiveRecord::Migration[5.1]
  def change
    create_join_table :themes, :preferences do |t|
       t.index [:theme_id, :preference_id]
       t.index [:preference_id, :theme_id]
    end
  end
end
