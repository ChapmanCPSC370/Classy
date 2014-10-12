class Section < ActiveRecord::Base
  validates :course_id, presence: true
  has_many :users
  belongs_to :course
  has_many :announcements
  has_many :assignments
  has_many :enrollments
  has_many :reviews
  
  def name
    if Course.exists?(course_id)
      return Course.find(course_id).name
    end
  end
  
end
