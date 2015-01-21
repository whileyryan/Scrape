class Article < ActiveRecord::Base
  validates :title, uniqueness: true
  require 'open-uri'


  def self.findSport(href)
    if href.include? ('nfl' || 'NFL')
      return 'NFL'
    elsif href.include? ('nba' || 'NBA')
      return 'NBA'
    elsif href.include? ('mlb' || 'MLB')
      return 'MLB'
    elsif href.include? ('nhl' || 'NHL')
      return 'NHL'
    elsif href.include? ('mls' || 'MLS' || 'soccer' || 'Soccer' || 'fc')
      return 'Soccer'
    else
      return 'Other'
    end
  end

  def self.get_websites(current_user)
    websites = Website.where(user_id: [0, current_user])
    p websites
    # websites = ['http://www.nfl.com/news', 'http://www.nba.com/news', 'http://espn.go.com/nfl', 'http://espn.go.com/nba']
    keyword_array = Word.where(user_id: [0, current_user])
    # keyword_array = [' out ', ' injur', ' start', ' concuss', ' bench', ' broke' ]
    websites.each do |website|
    page = Nokogiri::HTML(open("#{website['href']}"))  
    links = page.css('a')
      links.each do |link|
        keyword_array.each do |key|
          if link.text.include? (key['word'])
            if !link['href'].include? ('http')
              href = website['href'].concat(link['href'])
            else
              href = link['href']
            end
            sport = Article.findSport(href)
            Article.create(:title => link.text, :href => href, :sport => sport, :user_id => current_user)
          end
        end
      end
    end
  end
end


