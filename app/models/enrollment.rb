class Enrollment < ActiveRecord::Base
  validates :user_id, presence: true 
  validates :section_id, presence: true
  
  belongs_to :user
  belongs_to :section
end
