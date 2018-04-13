class AddSubjectIdToPreference < ActiveRecord::Migration[5.1]
  def change
    add_reference :preferences, :subject, foreign_key: true
  end
end
