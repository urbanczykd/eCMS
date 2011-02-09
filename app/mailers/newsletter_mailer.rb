class NewsletterMailer < ActionMailer::Base

  def news_mailer(email, body, title)
    @app_config = YAML::load(File.open("#{RAILS_ROOT.to_s}/config/config.yml"))
    @email = email
    @mail_body = body
    @mail_title = title
    @secret = Newsuser.find_by_email(email).secret
    mail(:to => "#{@email}", :subject => "#{@mail_title}", :from => @app_config["mailer"]["user_name"].to_s)
  end
  
end
