class Course < ActiveRecord::Base
  belongs_to :university
  has_many :posts
  validates :university_id, presence: true
end
