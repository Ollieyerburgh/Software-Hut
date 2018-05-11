class ChangeActivityStringsToDates < ActiveRecord::Migration[5.1]
  def self.up
    change_column :activities, :start_date, 'timestamp USING CAST(start_date AS timestamp)'
    change_column :activities, :end_date, 'timestamp USING CAST(end_date AS timestamp)'

  end

  def self.down
    change_column :activities, :start_date, :string
    change_column :activities, :end_date, :string
  end
end
