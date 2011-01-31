class CreateMmanagers < ActiveRecord::Migration
  def self.up
    create_table :mmanagers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :mmanagers
  end
end
