class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :badmin, :boolean, default: false
  end
end
