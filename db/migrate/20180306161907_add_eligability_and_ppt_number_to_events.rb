class AddEligabilityAndPptNumberToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :eligability, :string
    add_column :events, :capacity, :integer
  end
end
