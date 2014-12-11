class AddCurrentSchoolToUser < ActiveRecord::Migration
  def change
    add_column :users, :school_id, :integer
    add_column :users, :school_search_id, :integer
  end
end
