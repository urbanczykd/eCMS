class Admin::MmanagersController < AdminController
  before_filter :configure_app
  before_filter :basedir_create

  before_filter :show_directories
  before_filter :show_files
  
  def index
    
  end
  
  
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
    Dir.glob("*").sort.each do |directory|
      if directory.scan(/\w+\.\w+$/).empty?
        @dirs << directory
      end
    end
  end

  def show_files
    @files = []
    Dir.chdir(@mmanager_path)
    Dir.glob("*").sort.each do |file|
      if !file.scan(/\w+\.\w+$/).empty?
        @files << file
      end
    end
  end

  #####################
  
  
end
