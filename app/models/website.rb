class Website < ActiveRecord::Base
  validates_uniqueness_of :user_id, :scope => :href
end
