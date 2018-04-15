class CreateSubjectToActivityRelation < ActiveRecord::Migration[5.1]
  def change
    change_table :activities do |t|
      t.belongs_to :subject, index: true
    end
  end
end



