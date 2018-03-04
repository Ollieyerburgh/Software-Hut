class AddDeadlineDateToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :deadlinedate, :date

  end
end
