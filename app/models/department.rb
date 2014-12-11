class Department < ActiveRecord::Base
  #autocomplete :department, :name
  has_many :majors, dependent: :destroy
  has_many :courses
  belongs_to :university
end
