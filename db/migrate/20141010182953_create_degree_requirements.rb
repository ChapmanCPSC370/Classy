class CreateDegreeRequirements < ActiveRecord::Migration
  def change
    create_table :degree_requirements do |t|
      t.integer :course_id
      t.integer :major_id
      t.integer :minor_id

      t.timestamps
    end
  end
end
