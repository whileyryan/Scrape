class Website < ActiveRecord::Base
  validates :href, uniqueness: true
end
