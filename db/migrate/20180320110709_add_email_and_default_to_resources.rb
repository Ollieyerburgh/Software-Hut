class AddEmailAndDefaultToResources < ActiveRecord::Migration[5.1]
  def change
    change_column_default :resources, :status, 'pending'
    add_column :resources, :email, :string

  end
end
