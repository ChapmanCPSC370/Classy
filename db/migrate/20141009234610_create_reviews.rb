class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :section_id
      t.integer :rating
      t.text :description
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
