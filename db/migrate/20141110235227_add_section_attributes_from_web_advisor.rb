class AddSectionAttributesFromWebAdvisor < ActiveRecord::Migration
  def change
    add_column :sections, :units, :integer
    add_column :sections, :ge, :string
    add_column :sections, :academic_level, :string
    add_column :sections, :location, :string
    add_column :sections, :section_name_and_title, :string
    add_column :sections, :status, :string
  end
end
