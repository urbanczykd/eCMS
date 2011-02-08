class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string :title
      t.text :body
      t.boolean :ready, :default => false
      t.boolean :delived, :default => false
      t.datetime :delived_when
      t.boolean :delived_now, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
