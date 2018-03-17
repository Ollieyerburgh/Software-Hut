class CreateGuardian < ActiveRecord::Migration[5.1]
  def change
    create_table :guardians do |t|
      t.string :college
    end
  end
end
