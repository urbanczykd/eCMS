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
  
  
  
  def self.show_menu_list
    find_by_sql "SELECT articles.id, articles.title, menus.position FROM articles JOIN menus on articles.id = menus.article_id ORDER BY menus.position"
end
  
  
end

