class Website < ActiveRecord::Base
  validates :href, uniqueness: true
  validates_uniqueness_of :href, :scope => :user_id
end
