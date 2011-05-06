class Estate < ActiveRecord::Base
  
  FLICKR_API_KEY = 'efbad1d7a62010f8d79172057db5dd7d'
     FLICKR_SEARCH_URL = "http://api.flickr.com/services/rest/?api_key=#{FLICKR_API_KEY}&method=flickr.photos.search"
  belongs_to :user
  acts_as_gmappable
  default_scope :order => 'created_at' 

     def pictures
        hash = {:text => @location, :sort => 'relevance', :per_page => 32}
        parameters = URI.escape(hash.to_a.collect {|pair| pair.join('=')}.join('&'))
        results = ''
        pics = []
        open(FLICKR_SEARCH_URL + '&' + parameters) { |s| results = XmlSimple::xml_in(s.read, 'force_array' => false) }
        results['photos']['photo'].each { |p|
          pics << ["http://farm#{p['farm']}.static.flickr.com/#{p['server']}/#{p['id']}_#{p['secret']}_s.jpg",
            "http://farm#{p['farm']}.static.flickr.com/#{p['server']}/#{p['id']}_#{p['secret']}.jpg", p['title']]
        }
        pics 
     end
     
    def gmaps4rails_address
      #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
      address
      #"#{self.adresse}, #{self.ville}, #{self.pays}"
    end
    def gmaps4rails_infowindow
          # add here whatever html content you desire, it will be displayed when users clicks on the marker
       "<h2>from #{dbegin.day}/#{dbegin.month}/#{dbegin.year} to  #{dend.day}/#{dend.month}/#{dend.year} <br></h2><br/> <h3>#{address}</h3>"
    end
    
   def gmaps4rails_marker_picture
     {
     "picture" => "http://www.blankdots.com/img/github-32x32.png",
     "width" => "32",
     "height" => "32"
     }
   end
    def gmaps4rails_sidebar
      address #put whatever you want here
    end
end
