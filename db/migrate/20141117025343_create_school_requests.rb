class CreateSchoolRequests < ActiveRecord::Migration
  def change
    create_table :school_requests do |t|
      t.integer :user_id
      t.string :school_name
      t.integer :number_requests

      t.timestamps
    end
  end
end
