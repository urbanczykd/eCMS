class Admin::MmanagersController < AdminController
  before_filter :configure_app
  before_filter :basedir_create
  before_filter :show_directories
  before_filter :show_files
  before_filter :origin_path

  def index
    configure_app
    if !session[:path].nil?
        @mmanager_path = session[:path]
    end
    show_directories
    show_files
    @media = Mmanager.new
  end
  
  def create
    upload_media
    redirect_to admin_mmanagers_path
  end
  
  def place
    session[:path] = params[:dir]
    redirect_to admin_mmanagers_path
  end

  def create_directory
    if !directory_exists?(params[:path]+params[:dir])
      redirect_to admin_mmanagers_path, :notice => "Katalog juz istnieje prosze wybrac inna nazwe"
    else
      Dir.chdir(params[:path])
      Dir.mkdir(params[:dir].parameterize)
      redirect_to admin_mmanagers_path, :notice => "Katalog dodany"
    end
  end
  
  def upload_media
    post = Mmanager.save(params[:mmanager][:upload], params[:mmanager][:directory])
  end

  def del_file
    Dir.chdir(session[:path])
    File.delete(params[:f])
    redirect_to admin_mmanagers_path, :notice => "Plik poprawnie usuniety"
  end
  
  def del_dir
    Dir.chdir(session[:path])
      begin
        Dir.delete(params[:d])
      rescue
   redirect_to admin_mmanagers_path, :notice => "Blad, katalog nie jest pusty"
      else
   redirect_to admin_mmanagers_path, :notice => "Katalog usuniety"
      end
  end

  ###################################
  def configure_app
    @mmanager_config = YAML::load(File.open("#{RAILS_ROOT.to_s}/config/mmanager.yml"))
    @mmanager_path = @mmanager_config["path"]
    session[:origin_path] = @mmanager_config["path"]
    @mmanager_path = RAILS_ROOT+"/"+@mmanager_path
#1    return render :text => @mmanager_path 
# @mmanager_path /home/czacha/www/eCMS/public/mmanager    
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
#    @mmanager_path = "/home/czacha/www/eCMS/public/mmanager/"
    @dirs = []
    Dir.chdir(@mmanager_path)
    result = %x[find . ! -name . -prune -type d]
    result.each_line do |dir|
       if dir != "\n"
        @dirs << dir.gsub("./",'').chomp
       end
    end
  end

  def show_files
    @files = []
    Dir.chdir(@mmanager_path)
    result = %x[find . ! -name . -prune -type f]
    result.each_line do |file|
       file = file.split(".")
       @files << file[1].gsub("/", '')+"."+file[2].gsub(/[ ]/,'').chomp
    end
  end

  def show_file
#    session[:show_file] = root_url + @mmanager_config["url_path"] + session[:path].gsub(@mmanager_path, '') + params[:f]
    session[:show_file] = "http://localhost:3000/mmanager" +"/"+ params[:f]
    redirect_to admin_mmanagers_path
  end
  #####################
  def origin_path
   @origin_path = RAILS_ROOT.to_s+"/"+session[:origin_path]
#  return render :text => @origin_path
  end
  
end



