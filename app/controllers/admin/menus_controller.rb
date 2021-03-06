class Admin::MenusController < AdminController
  
  def index
    @articles = Article.show_menu_list
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    expire_one(params[:id])
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(admin_menus_path, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end
end
