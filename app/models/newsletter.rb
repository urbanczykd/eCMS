class Newsletter < ActiveRecord::Base
  after_create :deliver_now
  after_update :deliver_now
  
  private
  def deliver_now
    p "--------------------------------------"
    if self.delived_now == true then
      User.all.each do |user|
        p user.username
      end
    else
        p "Nie JEst FALSE!"
    end
    p "--------------------------------------"
  end
end
