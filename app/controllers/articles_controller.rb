class ArticlesController < ApplicationController

  caches_page :show
  
  def show
    @article = Article.find(params[:id])
    @tags = @article.tag
  end
end


