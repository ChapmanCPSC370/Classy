class Review < ActiveRecord::Base
  belongs_to :section
  belongs_to :user
end
