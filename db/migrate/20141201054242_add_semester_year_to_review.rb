class AddSemesterYearToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :semester_year, :string
  end
end
