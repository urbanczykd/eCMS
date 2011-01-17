class Article < ActiveRecord::Base
  acts_as_list

  validates :title, :presence => true
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  def self.show_publish
    all(:conditions => {:publish => true }, :order => :position)
  end
  
end

