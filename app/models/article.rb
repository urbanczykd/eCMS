class Article < ActiveRecord::Base
  acts_as_list
  belongs_to :user

  validates :title, :presence => true
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  def self.show_publish
    all(:conditions => {:publish => true }, :order => :position)
  end
  
  def self.show_like_list
    all(:order => :position)
  end
  
end

