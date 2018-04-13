class RemoveFkFromSubjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :subjects, :preference_id
  end
end
