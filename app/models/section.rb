class Section < ActiveRecord::Base
  validates :course_id, presence: true
  has_many :users
  belongs_to :course
  has_many :announcements
  has_many :assignments
  has_many :enrollments
  has_many :learning_resources, dependent: :destroy
  has_many :reviews
  
  def average_rating
    ave_rating = 0.0
    num_ratings = 0.0
    reviews.each do |r|
      ave_rating += r.rating
      num_ratings += 1
    end
    if num_ratings == 0
      num_ratings = 1
    end
    return (ave_rating / num_ratings).to_s
  end
  
  def name
    if Course.exists?(course_id)
      return Course.find(course_id).name
    end
  end
  
  def self.search(query)
    where("teacher like ?", "%#{query}%") 
  end
  
end
