class AddHidenCalToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :cal_hidden, :boolean
  end
end
