class CreateActivity < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.string :start_date
      t.string :end_date
      t.string :start_time
      t.string :end_time
      t.string :deadline #deadline for applying is time and date
      t.string :postcode
      t.string :address
      t.string :eligibility_criteria
      t.integer :capacity #number of people that can attend the activity
      t.string :link #needs to be required
      t.string :email
      t.string :status #approved, pending approval, rejected, changes requested
    end
  end
end
