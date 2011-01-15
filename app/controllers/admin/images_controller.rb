class Admin::ImagesController < AdminController
  
  def create
    @image = Image.new(params[:image])
    respond_to do |format|
      if @image.save
        format.html {redirect_to edit_admin_gallery_path(params[:gallery_id])}  
      else
        format.html {redirect_to admin_galleries_path }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
      @image.destroy
       respond_to do |format|
          format.html {redirect_to edit_admin_gallery_path(params[:gallery_id])}
       end
  end
  
  
end
