class Profile < ActiveRecord::Base
  belongs_to :user
  acts_as_gmappable
  
  
  STRING_FIELDS = %w{fname lname}
  VALID_GENDER = ["male", "female"]
  BEGIN_DATE = 1900
  VALID_DATES = DateTime.new(BEGIN_DATE)..DateTime.now
  validates_presence_of :fname, :lname
  validates_inclusion_of :gender, :in => VALID_GENDER.inspect, :allow_nil => true,  :message => "Please choose #{VALID_GENDER.join(" or ")}"
  validates_inclusion_of :birthdate, :in => VALID_DATES, :message => " date invalide"
  validates_length_of STRING_FIELDS, :maximum => 255, :message => "must be > 255"
  
  def to_param
    fname
  end
  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    address
    #"#{self.adresse}, #{self.ville}, #{self.pays}"
  end
end
