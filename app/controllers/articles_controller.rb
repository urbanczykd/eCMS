class ArticlesController < ApplicationController

#  caches_page :show
  
  def show
    @menu = Article.show_menu_list
    @article = Article.find(params[:id])
    @tags = @article.tag
  end
end


