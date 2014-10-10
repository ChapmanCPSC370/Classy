class Review < ActiveRecord::Base
  belongs_to :section, dependent: :destroy
end
