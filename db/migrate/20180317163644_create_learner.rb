class CreateLearner < ActiveRecord::Migration[5.1]
  def change
    create_table :learners do |t|
      t.string :college
      t.string :dob #date of birth
      t.integer :yos #year of study
    end
  end
end
