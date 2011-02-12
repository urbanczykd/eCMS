class Configuration
  
  def show_config
    @configutations = YAML::load(File.open("#{RAILS_ROOT.to_s}/config/config.yml"))
  end
end
