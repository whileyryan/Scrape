class ArticleController < ApplicationController
  def index
    @articles = Article.all
  end

  def getArticles
    Article.findArticles(params['website'])
    redirect_to "/user/#{current_user.id}"
  end

  def getAuto
    Article.get_websites(current_user.id)
    redirect_to "/user/#{current_user.id}"
  end
end
