class Newsuser < ActiveRecord::Base
  before_save :randsecret
  
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  def randsecret
    self.secret = rand(8999999999999999)+1000000000000000
  end

end
