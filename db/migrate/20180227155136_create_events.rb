class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :startdate
      t.date :enddate
      t.string :tags
      t.string :url

      t.timestamps
    end
  end
end
