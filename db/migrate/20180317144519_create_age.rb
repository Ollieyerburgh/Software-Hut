class CreateAge < ActiveRecord::Migration[5.1]
  def change
    create_table :ages do |t|
      t.string :age
    end
  end
end
