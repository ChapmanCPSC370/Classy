class AddTimesToSections < ActiveRecord::Migration
  def change
    add_column :sections, :start_time, :datetime
    add_column :sections, :end_time, :datetime
  end
end
