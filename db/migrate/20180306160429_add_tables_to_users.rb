class AddTablesToUsers < ActiveRecord::Migration[5.1]
  def change
      add_column :users, :forename, :string
      add_column :users, :surname, :string
      add_column :users, :postcode, :string
  end
end
