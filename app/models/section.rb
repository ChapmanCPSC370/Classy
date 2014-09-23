class Section < ActiveRecord::Base
  validates :course_id, presence: true
  has_many :users
  belongs_to :course
end
