class Assignment < ActiveRecord::Base
  validates :section_id, presence: true
  validates :name, presence: true
  validates :duedate, presence: true
  validates :points, presence: true
  belongs_to :section
end
