class Ad < ActiveRecord::Base
  attr_accessible :slug, :title, :description, :content

   validates_presence_of :slug, :title,  :message => "can't be blank"
   validates_length_of :slug, :title, :within => 4..255, :message => "must be > 255"
   validates_uniqueness_of :slug, :case_sensitive => false,  :message => "already exists"
   validates_length_of :description, :maximum => 1000,
       :too_long => "%{count} characters is the maximum allowed"
   
end
