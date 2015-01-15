class Article < ActiveRecord::Base
  validates :title, uniqueness: true
  require 'open-uri'

  def self.findArticles(user_website)
    keyword_array = [' out ', ' injur', ' start', ' concuss', ' bench', ' broke' ]
    page = Nokogiri::HTML(open("#{user_website}"))   
    links = page.css('a')
    links.each do |link|
      keyword_array.each do |key|
        if link.text.include? (key)
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

  def self.get_websites
    p '='*100
    p 'BOOM'
    websites = ['http://www.nfl.com/news', 'http://www.nba.com/news', 'http://espn.go.com/nfl', 'http://espn.go.com/nba']
    keyword_array = [' out ', ' injur', ' start', ' concuss', ' bench', ' broke' ]
    websites.each do |website|
    page = Nokogiri::HTML(open("#{website}"))   
    links = page.css('a')
      links.each do |link|
        keyword_array.each do |key|
          if link.text.include? (key)
            if !link['href'].include? ('http')
              p link
              p '='*100
              href = website + link['href']
            else
              href = link['href']
            end
            Article.create(:title => link.text, :href => href)
          end
        end
      end
    end
  end
end
