class AddAdminAndAmbassadorToUser < ActiveRecord::Migration
  def change
    add_column :users, :bAmbassador, :bool
  end
end
