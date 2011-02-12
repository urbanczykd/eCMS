class ContactMailer < ActionMailer::Base

  def contact_mailer(email, body, title)
    @app_config = YAML::load(File.open("#{RAILS_ROOT.to_s}/config/config.yml"))
    @email = email
    @mail_body = body
    @mail_title = title
    mail(:to => @app_config["contact"]["user_name"], :subject => "#{@mail_title}", :from => @email)
  end
  
end
