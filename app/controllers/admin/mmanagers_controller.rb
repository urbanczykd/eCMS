class Admin::MmanagersController < AdminController
  before_filter :configure_app
  before_filter :basedir_create

  before_filter :show_directories
  before_filter :show_files
  
  def index
    @media = Mmanager.new
  end
  
  def create
    upload_media
    redirect_to admin_mmanagers_path
  end
  
  
  def upload_media
    post = Mmanager.save(params[:mmanager][:upload], params[:mmanager][:directory])
  end
  ###################################  
  def configure_app
    @mmanager_config = YAML::load(File.open("#{RAILS_ROOT}/config/mmanager.yml"))
    @mmanager_path = @mmanager_config["path"]
    @mmanager_path = RAILS_ROOT+"/public/"+@mmanager_path
  end

  def directory_exists?(directory)
    Dir[directory].empty?
  end
  
  
  def basedir_create
    if directory_exists?(@mmanager_path) == true
      Dir.mkdir(@mmanager_path)
      Dir.chdir(@mmanager_path)
    else
      Dir.chdir(@mmanager_path)
    end
  end
  #####################
  def show_directories
    @dirs = []
    Dir.chdir(@mmanager_path)
    result = %x[ls -l | grep -v ^- | awk '{print $8}']
    result.each_line do |dir|
       if dir != "\n"
        @dirs << dir.chomp
       end
    end
  end

  def show_files
    @files = []
    Dir.chdir(@mmanager_path)
    result = %x[ls -l | grep ^- | awk '{print $8}']
    result.each_line do |file|
p       file.split(".")
      @files << file
    end
  end

  #####################
  
  
end
