class AddRequestStatusToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :request_status, :string, default: 'Pending'
  end
end
