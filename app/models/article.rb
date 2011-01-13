class Article < ActiveRecord::Base
  acts_as_list
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
