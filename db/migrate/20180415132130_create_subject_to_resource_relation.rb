class CreateSubjectToResourceRelation < ActiveRecord::Migration[5.1]
  def change
    change_table :resources do |t|
      t.belongs_to :subject, index: true
    end
  end
end

