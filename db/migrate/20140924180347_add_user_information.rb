class AddUserInformation < ActiveRecord::Migration
  def change
    add_column :users, :imageurl, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :major, :string
    add_column :users, :minor, :string
    add_column :users, :bio, :text
  end
end
