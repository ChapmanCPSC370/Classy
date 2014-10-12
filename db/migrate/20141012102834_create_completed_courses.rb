class CreateCompletedCourses < ActiveRecord::Migration
  def change
    create_table :completed_courses do |t|
      t.integer :course_id
      t.integer :section_id
      t.string :term
      t.integer :user_id
      t.string :grade

      t.timestamps
    end
  end
end
