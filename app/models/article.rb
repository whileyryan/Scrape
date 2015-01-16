class Article < ActiveRecord::Base
  validates :title, uniqueness: true
  require 'open-uri'

  def self.findArticles(user_website)
    # keyword_array = [' out ', ' injur', ' start', ' concuss', ' bench', ' broke' ]
    keyword_array = Word.where('user_id = 0')
    page = Nokogiri::HTML(open("#{user_website}"))   
    links = page.css('a')
    links.each do |link|
      keyword_array.each do |key|
        if link.text.include? (key['word'])
          if !link['href'].include? ('http')
            p link
            href = user_website + link['href']
          else
            href = link['href']
          end
          Article.create(:title => link.text, :href => href)
        end
      end
    end
  end

  def self.findSport(href)
    if href.include? ('nfl' || 'NFL')
      return 'NFL'
    elsif href.include? ('nba' || 'NBA')
      return 'NBA'
    elsif href.include? ('mlb' || 'MLB')
      return 'MLB'
    elsif href.include? ('nhl' || 'NHL')
      return 'NHL'
    elsif href.include? ('mls' || 'MLS' || 'soccer' || 'Soccer')
      return 'Soccer'
    else
      return 'Other'
    end
  end

  def self.get_websites
    websites = Website.where('user_id = 0')
    p websites
    # websites = ['http://www.nfl.com/news', 'http://www.nba.com/news', 'http://espn.go.com/nfl', 'http://espn.go.com/nba']
    keyword_array = Word.where('user_id = 0')
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
            Article.create(:title => link.text, :href => href, :sport => sport)
          end
        end
      end
    end
  end
end
