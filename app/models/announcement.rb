class Announcement < ActiveRecord::Base
  validates :info, presence: true
  validates :section_id, presence: true
  belongs_to :section
end
