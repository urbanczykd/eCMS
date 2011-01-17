class HomeController < ApplicationController
  def index
    @articles = Article.show_publish
  end
end
