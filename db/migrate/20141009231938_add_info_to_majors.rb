class AddInfoToMajors < ActiveRecord::Migration
  def change
    add_column :majors, :credits, :integer
  end
end
