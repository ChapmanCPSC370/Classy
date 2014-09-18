class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :course_id
      t.string :term
      t.string :teacher
      t.string :schedule
      t.string :room

      t.timestamps
    end
  end
end
