class Admin::GalleriesController < AdminController

  def index
    @galleries = Gallery.all
  end
  
  def new
    @gallery = Gallery.new
  end
  
  def edit
    @gallery = Gallery.find(params[:id])
    @image = Image.new
    @images = Image.all(:conditions => {:gallery_id => params[:id]}, :order => :position)
  end
  
  def create
    @gallery = Gallery.new(params[:gallery])
    respond_to do |format|
      if @gallery.save
        format.html {redirect_to admin_galleries_path }
      else
        format.html {redirect_to admin_galleries_path }        
      end
    end
  end
  
  def update
    @gallery = Gallery.find(params[:id])
    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html {redirect_to admin_galleries_path }
      else
        format.html {redirect_to admin_galleries_path }
      end
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
      respond_to do |format|
        format.html {redirect_to admin_galleries_path }
      end
  end

end
