class CreateLearningResources < ActiveRecord::Migration
  def change
    create_table :learning_resources do |t|
      t.string :name
      t.string :resourceurl
      t.text :description
      t.integer :section_id

      t.timestamps
    end
  end
end
