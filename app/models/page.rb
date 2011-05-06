class Page < ActiveRecord::Base
  attr_accessible :slug, :title, :content
  acts_as_url :title, :url_attribute => :slug, :scope => :page
  

  
   validates_presence_of :slug, :title,  :message => "can't be blank"
   validates_length_of :slug, :title, :within => 4..255, :message => "must be > 255"
   validates_uniqueness_of :slug, :case_sensitive => false,  :message => "already exists"
   def to_param
     "#{id}-#{slug}"
   end

end
