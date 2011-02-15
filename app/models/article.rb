class Article < ActiveRecord::Base
  acts_as_list  
  belongs_to :user
  belongs_to :menu

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
  
  def self.show_like_menu_list
    all(:conditions =>{:publish => true, :menu => 1}, :order => :menu_position)
  end
  
end

