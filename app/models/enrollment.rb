class Enrollment < ActiveRecord::Base
  validates :user_id, presence: true 
  validates :section_id, presence: true
  
  belongs_to :user
  belongs_to :section
  
  def cal_hide
    this.update_attribute(:cal_hidden, true)
  end

end
