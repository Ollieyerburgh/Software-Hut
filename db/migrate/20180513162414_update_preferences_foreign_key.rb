class UpdatePreferencesForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :preferences, :users

    add_foreign_key :preferences, :users, on_delete: :cascade

  end
end
