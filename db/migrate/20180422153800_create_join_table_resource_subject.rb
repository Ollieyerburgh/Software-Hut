class CreateJoinTableResourceSubject < ActiveRecord::Migration[5.1]
  def change
    create_join_table :resources, :subjects do |t|
      # t.index [:resource_id, :subject_id]
      # t.index [:subject_id, :resource_id]
    end
  end
end
