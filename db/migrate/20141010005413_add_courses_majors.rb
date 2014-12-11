class AddCoursesMajors < ActiveRecord::Migration
  def self.up
    create_table :courses_majors, :id => false do |t|
      t.integer :major_id
      t.integer :course_id
    end
  end

  def self.down
    drop_table :courses_majors
  end
end
