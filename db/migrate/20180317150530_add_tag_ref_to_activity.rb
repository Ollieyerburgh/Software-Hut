class AddTagRefToActivity < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :tag, foreign_key: true
  end
end
