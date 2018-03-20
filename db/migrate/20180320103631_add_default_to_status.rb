class AddDefaultToStatus < ActiveRecord::Migration[5.1]
  def change
    change_column_default :activities, :status, 'pending'
  end
end
