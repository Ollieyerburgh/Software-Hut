class CreateJoinTableActivityAge < ActiveRecord::Migration[5.1]
  def change
    create_join_table :activities, :ages do |t|
      t.index [:activity_id, :age_id]
      # t.index [:age_id, :activity_id]
    end
  end
end
