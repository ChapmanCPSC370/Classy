class Major < ActiveRecord::Base
  belongs_to :university
  belongs_to :department
  has_many :degree_requirements
  has_many :users
  has_and_belongs_to_many :courses
  
  def total_credits
    counted_credits = 0
    degree_requirements.each do |f|
      counted_credits += 3
    end
    return counted_credits
  end
end
