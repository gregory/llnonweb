class AddGravatarToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :avatar_url, :string, :limit => 255
  end

  def self.down
    remove_column :profiles, :avatar_url
  end
end
