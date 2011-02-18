class AddFrontpageToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :frontpage, :boolean, :default => false
  end

  def self.down
    remove_column :articles, :frontpage
  end
end
