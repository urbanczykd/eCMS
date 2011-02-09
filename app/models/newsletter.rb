class Newsletter < ActiveRecord::Base
  after_create :deliver_now
  after_update :deliver_now
  
  private
  def deliver_now
    if self.delived_now == true then
      Newsuser.all.each do |user|
        NewsletterMailer.news_mailer(user.email, self.body, self.title).deliver
        @newsletter = Newsletter.find(self.id)
        @newsletter.update_attributes(:delived_now => 0, :delived_when => Time.now)
        @newsletter.save
      end
    end
  end
end
