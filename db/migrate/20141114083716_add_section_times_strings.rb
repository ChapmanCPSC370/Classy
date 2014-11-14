class AddSectionTimesStrings < ActiveRecord::Migration
  def change
    add_column :sections, :start_time_s, :string
    add_column :sections, :end_time_s, :string
  end
end
