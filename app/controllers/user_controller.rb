class UserController < ApplicationController
  require 'twitter'




  def show
    @words = Word.where(user_id: [0, "#{current_user.id}"])
    @websites = Website.where(user_id: [0, "#{current_user.id}"])
    @nba = Article.order(id: :desc).where(sport: 'NBA')
    @nfl = Article.order(id: :desc).where(sport: 'NFL')
    @nhl = Article.order(id: :desc).where(sport: 'NHL')
    @mlb = Article.order(id: :desc).where(sport: 'MLB')
    @mls = Article.order(id: :desc).where(sport: 'Soccer')
    @other = Article.order(id: :desc).where(sport: 'Other')
    @tweets = Tweet.order(id: :desc)
  end

  def getTweets
    Tweet.getTweets(current_user.id)
    redirect_to "/user/#{current_user.id}"
  end

  def addSource
    Source.create(user_id: current_user.id, handle: params['handle'])
    redirect_to "/preferences/#{current_user.id}"
  end

  def addWord
    Word.create(user_id: current_user.id, word: params['word'])
    redirect_to "/user/#{current_user.id}"
  end

  def addWebsite
    Website.create(user_id: current_user.id, href: params['href'])
    redirect_to "/user/#{current_user.id}"
  end

  def preferences
    @words = Word.where(user_id: [0, "#{current_user.id}"])
    @websites = Website.where(user_id: [0, "#{current_user.id}"])
    @sources = Source.where(:user_id => "#{current_user.id}")
  end

  def packages
    User.storePackages(params['sport'], current_user.id)
    redirect_to "/user/#{current_user.id}"
  end

  def garbageCollection
    Article.where('created_at > ?', 5.days.ago).each do |model|
      model.destroy
    end

    Tweet.where('created_at > ?', 5.days.ago).each do |model|
      model.destroy
    end
    redirect_to "/user/#{current_user.id}"
  end
 
end
