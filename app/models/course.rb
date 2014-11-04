class Course < ActiveRecord::Base
  
  belongs_to :university
  has_and_belongs_to_many :majors, through: :degree_requirements
  has_many :posts, dependent: :destroy
  has_many :degree_requirements, dependent: :destroy
  has_many :sections, dependent: :destroy
  belongs_to :department
  validates :university_id, presence: true
  validates :department_id, presence: true
  
  def average_rating
    ave_rating = 0.0
    num_ratings = 0.0
    sections.each do |f|
      f.reviews.each do |r|
        ave_rating += r.rating
        num_ratings += 1
      end
    end
    if num_ratings == 0
      num_ratings = 1
    end
    return (ave_rating / num_ratings).to_s
  end
  
  def full_name
    return "" + department.department_tag + " " + course_number.to_s + " " + name 
  end

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end
