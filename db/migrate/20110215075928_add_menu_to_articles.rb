class AddMenuToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :menu, :boolean, :default => false
    add_column :articles, :menu_position, :integer
  end

  def self.down
    remove_column :articles, :menu
    remove_column :articles, :menu_position
  end
end
