class NewsletterMailer < ActionMailer::Base

  def news_mailer(email, body, title)
    @app_config = YAML::load(File.open("#{RAILS_ROOT.to_s}/config/config.yml"))
    @email_to = email
    @mail_body = body
    @mail_title = title
mail(:to => "#{@email_to}", :from =>"#{@app_config["mailer"]["user_name"]}", :subject => "#{@mail_title}", :content_type => 'text/html').deliver 
#:content_type => 'text/plain'
  end
  
end
