class Course < ActiveRecord::Base
  belongs_to :university
  has_many :posts
  has_many :sections
  validates :university_id, presence: true
end
