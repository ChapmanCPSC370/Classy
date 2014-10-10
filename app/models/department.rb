class Department < ActiveRecord::Base
  has_many :majors
  has_many :courses
  belongs_to :university
end
