class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    @tags = @article.tag
  end
end


