class CreateJoinTableActivitySubject < ActiveRecord::Migration[5.1]
  def change
    create_join_table :activities, :subjects do |t|
      t.index [:activity_id, :subject_id]
      # t.index [:subject_id, :activity_id]
    end
  end
end
