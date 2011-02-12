class Admin::ConfigurationsController < AdminController

  def edit
    @config = Configuration.new.show_config
  end
  
  def update
    File.open("#{RAILS_ROOT}/config/config.yml", 'w') { |f| 
    YAML.dump(params[:dane], f)
    }
  redirect_to admin_configuration_path

  end
end
