class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :enrollments, dependent: :destroy
  belongs_to :major
  
  def total_enrolled_credits
    Integer total = 0
    enrollments.each do |f|
      total += 3
    end
    return total
  end
  
  def enrolled?(section)
    enrollments.find_by(section_id: section.id)
  end
  
  def enrolled_major?(major)
    if self.major == major
      return true
    else
      return false
    end
  end
  
  def full_name 
    return first_name + " " + last_name
  end
end
