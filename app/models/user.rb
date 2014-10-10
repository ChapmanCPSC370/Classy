class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :enrollments
  belongs_to :major
  
  def enrolled?(section)
    enrollments.find_by(section_id: section.id)
  end
end
