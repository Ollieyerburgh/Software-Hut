class AddActivityIdToSubjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :subjects, :activity, foreign_key: true
  end
end
