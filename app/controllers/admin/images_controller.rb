class Admin::ImagesController < AdminController
  
  def edit
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    @images = Image.all(:conditions => {:gallery_id => params[:gallery_id]})
  end
  
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

  def update
#    return render :text => "#{params[:image][:photo].nil?}"
    @image = Image.find(params[:id])
    respond_to do |format|
      if params[:image][:photo].nil?      
          if @image.update_attributes(:name => params[:image][:name])
            format.html {redirect_to edit_admin_gallery_path(params[:gallery_id])}          
          else
            format.html {redirect_to edit_admin_gallery_image_path(params[:gallery_id], params[:id])}
          end
      else
#        return render :text => "#{params.to_yaml}"
          if @image.update_attributes(params[:image])
            format.html {redirect_to edit_admin_gallery_path(params[:gallery_id])}
          else
            return render :text => "cos sie zjebalo"
            format.html {redirect_to edit_admin_gallery_image_path(params[:gallery_id]), params[:id]}
          end
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
