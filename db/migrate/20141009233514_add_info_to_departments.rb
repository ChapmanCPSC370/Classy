class AddInfoToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :university_id, :integer
  end
end
