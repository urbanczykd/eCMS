@app_config = YAML::load(File.open("#{RAILS_ROOT.to_s}/config/config.yml"))


ActionMailer::Base.smtp_settings = {
  :address              => @app_config["mailer"]["adress"],
  :port                 => @app_config["mailer"]["port"].to_i,
  :domain               => @app_config["mailer"]["domain"],
  :user_name            => @app_config["mailer"]["user_name"],
  :password             => @app_config["mailer"]["password"],
  :authentication       => @app_config["mailer"]["authentication"],
  :enable_starttls_auto => true
}
