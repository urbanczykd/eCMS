class CreateNewsusers < ActiveRecord::Migration
  def self.up
    create_table :newsusers do |t|
      t.string :email
      t.string :secret

      t.timestamps
    end
  end

  def self.down
    drop_table :newsusers
  end
end
