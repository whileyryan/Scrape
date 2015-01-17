# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# websites = ['http://www.nfl.com/news', 'http://www.nba.com/news', 'http://espn.go.com/nfl', 'http://espn.go.com/nba']
# websites.each do |web|
#   Website.create(:href => web, :user_id => 0)
# end

words = [' out ', ' injur', ' start', ' concuss', ' bench', ' broke', ' ban' ]
words.each do |word|
  Word.create(:word => word, :user_id => 0)
end