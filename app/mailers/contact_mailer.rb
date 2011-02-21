class ContactMailer < ActionMailer::Base

  def con_mailer(email, body, title)
    @app_config = YAML::load(File.open("#{RAILS_ROOT.to_s}/config/config.yml"))
    @email_from = email
    @mail_body = body
    @mail_title = title
    mail(:to => @email_from, :subject => "#{@mail_title}", :from => @email_from, :content_type => 'text/html').deliver
  end
  
end
