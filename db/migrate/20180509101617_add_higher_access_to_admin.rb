class AddHigherAccessToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :higher_access, :boolean, :default => false 
  end
end
