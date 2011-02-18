class HomeController < ApplicationController
 # caches_page :index
  
  def index
    @menu = Article.show_menu_list
    @articles = Article.show_publish_on_frontpage
    @newsuser = Newsuser.new
  end

end
