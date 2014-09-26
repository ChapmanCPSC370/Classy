class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.integer :university_id
      t.string :name
      t.text :description
      t.integer :department_id
      t.integer :units_required

      t.timestamps
    end
  end
end
