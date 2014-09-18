class AddCourseIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :course_id, :integer
  end
end
