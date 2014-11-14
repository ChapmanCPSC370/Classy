class AddDaysStringToSections < ActiveRecord::Migration
  def change
    add_column :sections, :days, :string
  end
end
