class AddDepartmentTagToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :department_tag, :string
  end
end
