class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :section_id
      t.string :name
      t.text :description
      t.datetime :duedate
      t.float :points

      t.timestamps
    end
  end
end
