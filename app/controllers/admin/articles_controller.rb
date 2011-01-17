class Admin::ArticlesController < AdminController

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end
  
  def create
#    return render :text => "params => #{params.to_yaml}"
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
format.html { redirect_to(admin_articles_path, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/article/1
  # PUT /admin/article/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to([:admin, @article], :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/article/1
  # DELETE /admin/article/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admin_articles_url) }
      format.xml  { head :ok }
    end
  end
  
  ################
  def publish
    @article = Article.find(params[:article_id])
    respond_to do |format|
      if @article.update_attributes(:publish => params[:publish])
        format.html {redirect_to(admin_articles_url)}        
      else
        format.html {redirect_to(admin_articles_url)}
      end
    end
  end
  
  
end
