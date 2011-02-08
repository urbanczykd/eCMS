class Admin::NewslettersController < AdminController
  
  def index
    @newsletters = Newsletter.all
  end
  
  def new
    @newsletter = Newsletter.new
  end
  
  def edit
    @newsletter = Newsletter.find(params[:id])
  end
  
  def create
    @newsletter = Newsletter.new(params[:newsletter])
    respond_to do |format|
      if @newsletter.save
        format.html {redirect_to admin_newsletters_path, :notice => "Newsletter save"}
      else
        format.html {redirect_to admin_newsletters_path, :notice => "save newsletter fail!"}
      end
    end
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.update_attributes(params[:newsletter])
      redirect_to admin_newsletters_path, :notice => "Newsletter zaktualizowany"
    else
      redirect_to admin_newsletters_path, :notce => "Newsletter nie zaktualizowany!"
    end
  end
  
  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to admin_newsletters_path, :notice => "Newsletter usuniety"
  end
  
end
