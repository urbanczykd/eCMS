class Menu < ActiveRecord::Base
  acts_as_list
  has_many :articles
end
