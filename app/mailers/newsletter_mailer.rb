class NewsletterMailer < ActionMailer::Base
#  default :from => "from@example.com"

  def news_mailer(email, body)
    @email = email
    @mail_body = body
    p body
    p "nademna body!"
    p "podemna @body"
    p @body
    @secret = Newsuser.find_by_email(email).secret
    mail(:to => "#{@email}", :subject => "Newsletter", :from => "czacha1@gmail.com")
  end
  
end
