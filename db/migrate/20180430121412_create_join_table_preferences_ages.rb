class CreateJoinTablePreferencesAges < ActiveRecord::Migration[5.1]
  def change
    create_join_table :preferences, :ages do |t|
      t.index [:preference_id, :age_id]
      t.index [:age_id, :preference_id]
    end
  end
end
