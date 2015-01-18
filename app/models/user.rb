class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:yahoo]

  def self.storePackages(package, current_user)
    package.each do |pack|
      if pack == 'Football'
        Website.create(:user_id => current_user, :href => "http://www.nfl.com/news")
        Website.create(:user_id => current_user, :href => "http://espn.go.com/nfl")
      elsif pack == 'Basketball'
        Website.create(:user_id => current_user, :href => "http://www.nba.com/news")
        Website.create(:user_id => current_user, :href => "http://espn.go.com/nba")
      elsif pack == 'Baseball'
        Website.create(:user_id => current_user, :href => "http://m.mlb.com/news")
        Website.create(:user_id => current_user, :href => "http://espn.go.com/mlb")
      elsif pack == 'Hockey'
        Website.create(:user_id => current_user, :href => "http://espn.go.com/nhl")
        Website.create(:user_id => current_user, :href => "http://www.nhl.com/ice/newsindex") 
      elsif pack == 'Soccer'
        Website.create(:user_id => current_user, :href => "http://www.mlssoccer.com/news")
        Website.create(:user_id => current_user, :href => "http://www.espnfc.us")
      end
    end
  end

end
