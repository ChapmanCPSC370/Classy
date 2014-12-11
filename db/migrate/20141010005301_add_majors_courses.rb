class AddMajorsCourses < ActiveRecord::Migration
  def self.up
    create_table :majors_courses, :id => false do |t|
      t.integer :major_id
      t.integer :course_id
    end
  end

  def self.down
    drop_table :majors_courses
  end
end
