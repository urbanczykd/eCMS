class Admin::ArticlesController < AdminController
  before_filter :expire_root, :except => [:index, :show]
  before_filter :expire_all, :only => [:act] # uruchomione na stesty :)  
  def index
    @articles = Article.show_like_list
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
         @article.move_to_top
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
    expire_one(params[:id])
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
    expire_one(params[:id])

    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admin_articles_url) }
      format.xml  { head :ok }
    end
  end
  
  ################
  def act 
    @article = Article.find(params[:article_id])
    if (params[:art_act] == "true" || params[:art_act] == "false")
      respond_to do |format|
          if @article.update_attributes(:publish => params[:art_act])
            format.html {redirect_to(admin_articles_url)}        
          else
            format.html {redirect_to(admin_articles_url)}
          end
        end 
    elsif params[:art_act] == "up"
      respond_to do |format|
          if @article.move_higher
            format.html {redirect_to(admin_articles_url)}
          else
            format.html {redirect_to(admin_articles_url)}
          end
      end
    elsif params[:art_act] == "down"
      respond_to do |format|
          if @article.move_lower
            format.html {redirect_to(admin_articles_url)}
          else
            format.html {redirect_to(admin_articles_url)}
          end
      end
    elsif params[:art_act] == "yes"
      respond_to do |format|
          if @article.update_attributes(:menu => 1)
            format.html {redirect_to(admin_articles_url)}
          else
            format.html {redirect_to(admin_articles_url)}
          end
      end
    elsif params[:art_act] == "no"
      respond_to do |format|
          if @article.update_attributes(:menu => 0)
            format.html {redirect_to(admin_articles_url)}
          else
            format.html {redirect_to(admin_articles_url)}
          end
      end
    end
  end
  
  def menu
    @article = Article.find(params[:article_id])
    if params[:menu_act] == "yes"    
      @menu = Menu.new(:article_id => Article.find_by_id(params[:article_id]).id)
      @menu.save
      respond_to do |format|
          if @menu.save
            format.html {redirect_to(admin_menus_url)}
          else
            format.html {redirect_to(admin_menus_url)}
          end
      end
    elsif params[:menu_act] == "no"
      respond_to do |format|
        @menu = Menu.find(:first, :conditions => {:article_id => Article.find_by_id(params[:article_id]).id})        
        @menu.destroy
            format.html {redirect_to(admin_menus_url)}
      end
    elsif params[:menu_act] == "up"
      respond_to do |format|
          if @article.menu_position.move_higher
            format.html {redirect_to(admin_articles_url)}
          else
            format.html {redirect_to(admin_articles_url)}
          end
    end
    end
    
  end

end





