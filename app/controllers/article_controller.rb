class ArticleController < ApplicationController
  def index
    @articles = Article.all
  end

  def getArticles
    Article.findArticles(params['website'])
    redirect_to '/'
  end

  def getAuto
    Article.get_websites
    redirect_to '/'
  end
end
