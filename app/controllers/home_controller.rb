class HomeController < ApplicationController
#  cache_page :controller => "home", :action => "index"
#  expire_page :controlle => "home", :action => "index"
  def index
    @articles = Article.show_publish
  end
end
