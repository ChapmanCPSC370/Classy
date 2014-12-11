class AddHiddenBoolToSections < ActiveRecord::Migration
  def change
    add_column :sections, :cal_hidden, :boolean
  end
end
