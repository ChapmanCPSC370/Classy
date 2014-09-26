class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.integer :section_id
      t.text :info

      t.timestamps
    end
  end
end
