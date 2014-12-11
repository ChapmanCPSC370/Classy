class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :department_id
      t.string :degree
      t.string :alma_mater
      t.integer :university_id

      t.timestamps
    end
  end
end
