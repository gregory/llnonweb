class AddGmapToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :address, :string
    add_column :profiles, :latitude, :float
    add_column :profiles, :longitude, :float
    add_column :profiles, :gmaps, :boolean
  end

  def self.down
    remove_column :profiles, :gmaps
    remove_column :profiles, :longitude
    remove_column :profiles, :latitude
    remove_column :profiles, :address
  end
end
