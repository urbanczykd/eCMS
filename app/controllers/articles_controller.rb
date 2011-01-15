class ArticlesController < ApplicationController

  def show
#    return render :text => "params => #{params.to_yaml}"
    @article = Article.find(params[:id])
  end
end


