class CreateSubject < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :subject_name
    end
  end
end
