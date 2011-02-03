class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters 
      
  end

  def self.down
    drop_table :newsletters
  end
end
