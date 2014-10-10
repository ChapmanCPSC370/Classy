class Enrollment < ActiveRecord::Base
  validates :user_id, presence: true 
  validates :section_id, presence: true
  
  belongs_to :user, dependent: :destroy
  belongs_to :section, dependent: :destroy
end
