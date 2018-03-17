class AddUserRefToAdviser < ActiveRecord::Migration[5.1]
  def change
    add_reference :advisers, :user, foreign_key: true
  end
end
