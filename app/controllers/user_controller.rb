class UserController < ApplicationController
  def show
    @words = Word.where(user_id: [0, "#{current_user.id}"])
    @websites = Website.where(user_id: [0, "#{current_user.id}"])
    @nba = Article.order(id: :desc).where(sport: 'NBA')
    @nfl = Article.order(id: :desc).where(sport: 'NFL')
    @nhl = Article.order(id: :desc).where(sport: 'NHL')
    @mlb = Article.order(id: :desc).where(sport: 'MLB')
    @mls = Article.order(id: :desc).where(sport: 'Soccer')
    @other = Article.order(id: :desc).where(sport: 'Other')
  end

  def addWord
    p params
    Word.create(user_id: current_user.id, word: params['word'])
    redirect_to "/user/#{current_user.id}"
  end

  def addWebsite
    Wwebsite.create(user_id: current_user.id, href: params['href'])
    redirect_to "/user/#{current_user.id}"
  end

  def preferences
    @words = Word.where(user_id: [0, "#{current_user.id}"])
    @websites = Website.where(user_id: [0, "#{current_user.id}"])
  end

  def packages
    p params['sport']
    User.storePackages(params['sport'], current_user.id)
    redirect_to "/user/#{current_user.id}"
  end

end
