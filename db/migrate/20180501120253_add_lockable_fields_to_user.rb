class AddLockableFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at
    end
  end
end
