class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :school, :string
    add_column :users, :dob, :string
    add_column :users, :answer, :string
    add_column :users, :organisation, :string
    add_column :users, :studyyear, :string
    add_column :users, :associatedschool, :string



  end
end
