class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :slug, :limit => 255, :null => false
      t.string :title, :limit => 255, :null => false
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
