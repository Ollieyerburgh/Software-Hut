class CreateResource < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :status
    end
  end
end
