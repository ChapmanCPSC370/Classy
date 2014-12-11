class Review < ActiveRecord::Base
  belongs_to :section
  belongs_to :user
  
  validates :description, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validates :section_id, presence: true
end
