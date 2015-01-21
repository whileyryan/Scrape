class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.storePackages(package, current_user)
    package.each do |pack|
      if pack == 'Football'
        Website.create(:user_id => current_user, :href => "http://www.nfl.com/news")
        Website.create(:user_id => current_user, :href => "http://espn.go.com/nfl")
        Source.create(:user_id => current_user, :handle => "ESPNNFL")
        Source.create(:user_id => current_user, :handle => "NFL")
        Source.create(:user_id => current_user, :handle => "AdamSchefter")
        
      elsif pack == 'Basketball'
        Website.create(:user_id => current_user, :href => "http://www.nba.com/news")
        Website.create(:user_id => current_user, :href => "http://espn.go.com/nba")
        Source.create(:user_id => current_user, :handle => "ESPNNBA")
        Source.create(:user_id => current_user, :handle => "NBA")
        Source.create(:user_id => current_user, :handle => "WojYahooNBA")
        
      elsif pack == 'Baseball'
        Website.create(:user_id => current_user, :href => "http://m.mlb.com/news")
        Website.create(:user_id => current_user, :href => "http://espn.go.com/mlb")
        Source.create(:user_id => current_user, :handle => "MLB")
        Source.create(:user_id => current_user, :handle => "Buster_ESPN")
        
      elsif pack == 'Hockey'
        p 'shitfuckstack'
        Website.create(:user_id => current_user, :href => "http://espn.go.com/nhl")
        Website.create(:user_id => current_user, :href => "http://www.nhl.com/ice/newsindex") 
        Source.create(:user_id => current_user, :handle => "NHL")
        Source.create(:user_id => current_user, :handle => "TSNBobMcKenzie")
        
      elsif pack == 'Soccer'
        Website.create(:user_id => current_user, :href => "http://www.mlssoccer.com/news")
        Website.create(:user_id => current_user, :href => "http://www.espnfc.us")
        Source.create(:user_id => current_user, :handle => "MLS")
        Source.create(:user_id => current_user, :handle => "MLSAnalyst")

      end
    end
  end



end
