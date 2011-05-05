class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :slug, :null => false, :limit => 255
      t.string :title, :null => false, :limit => 255
      t.text :description
      t.text :content
      t.timestamps
    end
    add_index :ads, :slug, :unique => true
  end

  def self.down
    drop_table :ads
  end
end
