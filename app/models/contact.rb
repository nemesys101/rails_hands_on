class Contact < ActiveRecord::Base
  validates_uniqueness_of :email
  #validates_presence_of :first_name
  #validates_presence_of :last_name
  validates_presence_of :email, :message => "como no tenes email?"
  
end
