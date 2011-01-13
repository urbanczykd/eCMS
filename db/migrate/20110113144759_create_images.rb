class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :gallery_id
      t.string :name
      t.integer :position
      

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
