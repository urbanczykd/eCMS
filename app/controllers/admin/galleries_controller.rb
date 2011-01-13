class Admin::GalleriesController < AdminController

  def index
    @galleries = Gallery.all
  end
  
  def new
    @gallery = Gallery.new
  end
  
  def edit
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images
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
      if @gallery.update_attributes(params[:gallery][:name])
        if params[:gallery][:image]
#          @image = Image.new(:gallery_id => params[:id], params[:gallery][:image])
          
          return render :text => "tak istnieje"
        end
        format.html {redirect_to admin_galleries_path }
      else
        format.html {redirect_to admin_galleries_path }
      end
    end
  end

  def destroy
  end

end
