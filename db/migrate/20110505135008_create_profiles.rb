class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id, :null =>false
      t.string :fname, :default => ""
      t.string :lname, :default => ""
      t.string :gender, :default => ""
      t.date :birthdate

      t.timestamps
    end
    add_index :profiles, :user_id, :unique => true
  end

  def self.down
    drop_table :profiles
  end
end
