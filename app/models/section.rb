class Section < ActiveRecord::Base
  validates :course_id, presence: true
  has_many :users
  belongs_to :course
  has_many :announcements
  has_many :assignments
  has_many :enrollments
end
