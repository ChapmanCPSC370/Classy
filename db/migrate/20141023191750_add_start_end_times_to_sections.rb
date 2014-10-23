class AddStartEndTimesToSections < ActiveRecord::Migration
  def change
    add_column :sections, :time_start, :time
    add_column :sections, :time_end, :time
    add_column :sections, :days_of_class, :time
  end
end
