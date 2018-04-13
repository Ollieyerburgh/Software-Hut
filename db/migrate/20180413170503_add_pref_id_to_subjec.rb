class AddPrefIdToSubjec < ActiveRecord::Migration[5.1]
  def change
    add_reference :subjects, :preference, foreign_key: true
  end
end
