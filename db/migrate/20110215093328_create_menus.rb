class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.integer :position
      t.integer :article_id

      t.timestamps
    end
    remove_column :articles, :menu
  end

  def self.down
    drop_table :menus
    add_column :articles, :menu, :integer
  end
end
