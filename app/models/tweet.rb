class Tweet < ActiveRecord::Base
  validates_uniqueness_of :tweet, :scope => :user_id
  require 'twitter'

  def self.getTweets(current_user)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET_KEY']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
    p '='*100
    p ENV['TWITTER_CONSUMER_KEY']
    p '='*100
    keyword_array = Word.where(:user_id => current_user)
    sources = Source.where(:user_id => current_user)
    sources.each do |source|
      client.user_timeline("#{source.handle}").each do |tweet|
        keyword_array.each do |word|
          if tweet.text.include? (word)
            p true
            Tweet.create(:user_id => current_user, :tweet => tweet)
          end
        end
      end
    end

  end
end
