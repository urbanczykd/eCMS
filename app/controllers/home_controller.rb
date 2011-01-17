class HomeController < ApplicationController

  caches_page :index
  
  def index
    @articles = Article.show_publish
  end
end
