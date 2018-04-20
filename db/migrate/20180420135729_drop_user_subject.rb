class DropUserSubject < ActiveRecord::Migration[5.1]
  def change
    drop_table :subjects_users
  end
end
