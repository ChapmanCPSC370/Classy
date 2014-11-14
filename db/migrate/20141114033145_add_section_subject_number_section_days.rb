class AddSectionSubjectNumberSectionDays < ActiveRecord::Migration
  def change
    add_column :sections, :subject, :string
    add_column :sections, :section_number, :string
    add_column :sections, :section_section, :string
    add_column :sections, :section_datatel_number, :string
    add_column :sections, :start_date, :date
    add_column :sections, :end_date, :date
  end
end
