class Department < ActiveRecord::Base
  has_many :majors, dependent: :destroy
  has_many :courses
  belongs_to :university
end
