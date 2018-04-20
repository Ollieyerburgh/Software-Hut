class CreateJoinTablePreferencesSubjects < ActiveRecord::Migration[5.1]
  def change
    create_join_table :preferences, :subjects do |t|
      t.index [:preference_id, :subject_id]
      t.index [:subject_id, :preference_id]
    end
  end
end
