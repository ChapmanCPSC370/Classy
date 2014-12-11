class AddCourseNumberToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :department_tag, :string
    add_column :courses, :course_number, :integer
  end
end
