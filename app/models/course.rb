class Course < ActiveRecord::Base
  belongs_to :university
  has_and_belongs_to_many :major
  has_many :posts
  has_many :degree_requirements
  has_many :sections
  belongs_to :department
  validates :university_id, presence: true
  validates :department_id, presence: true
end
