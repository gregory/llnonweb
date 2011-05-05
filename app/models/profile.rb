class Profile < ActiveRecord::Base
  belongs_to :user
  
  STRING_FIELDS = %w{fname lname}
  VALID_GENDER = ["male", "female"]
  BEGIN_DATE = 1900
  VALID_DATES = DateTime.new(BEGIN_DATE)..DateTime.now
  
  validates_inclusion_of :gender, :in => VALID_GENDER, :allow_nil => false, :message => "Please choose male or female"
  validates_inclusion_of :birthdate, :in => VALID_DATES, :message => " date invalide"
  validates_length_of STRING_FIELDS, :maximum => 255, :message => "must be > 255"
  
end
