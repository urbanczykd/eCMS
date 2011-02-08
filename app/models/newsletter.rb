class Newsletter < ActiveRecord::Base
  after_create :deliver_now
  after_update :deliver_now
  
  private
  def deliver_now
    p "--------------------------------------"
    if self.delived_now == true then
      p " Jestem w deliver MAIL!"
      User.all.each do |user|
        NewsletterMailer.news_mailer(user.email, self.body).deliver
      end
    else
        p "Nie JEst FALSE!"
    end
    p "--------------------------------------"
  end
end
