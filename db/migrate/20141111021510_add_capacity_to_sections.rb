class AddCapacityToSections < ActiveRecord::Migration
  def change
    add_column :sections, :capacity, :integer
  end
end
