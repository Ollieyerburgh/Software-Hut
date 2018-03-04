class AddOthersToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :location, :string
    add_column :events, :tags, :string
    add_column :events, :add_documents, :string
    add_column :events, :email, :string
  end
end
