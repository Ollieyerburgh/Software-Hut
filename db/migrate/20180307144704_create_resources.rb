class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :tags
      t.string :add_documents
      

      t.timestamps
    end
  end
end
