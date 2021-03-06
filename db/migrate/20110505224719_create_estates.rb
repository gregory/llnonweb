class CreateEstates < ActiveRecord::Migration
  def self.up
    create_table :estates do |t|
      t.integer :user_id
      t.integer :nbrooms
      t.boolean :active
      t.datetime :dbegin
      t.datetime :dend
      t.text :excerpt
      t.text :content
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end

  def self.down
    drop_table :estates
  end
end
