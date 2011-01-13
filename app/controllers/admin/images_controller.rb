class Admin::ImagesController < AdminController
  
  def create
    @image = Image.new(params[:image])
    respond_to do |format|
      if @image.save
        format.html {redirect_to admin_gallery_path(params[:gallery_id])}  
      else
        format.html {redirect_to admin_galleries_path }
      end
    end
  end
  
  
end
