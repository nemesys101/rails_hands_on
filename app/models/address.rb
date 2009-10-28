class Address < ActiveRecord::Base
  include StiExtensions
  AVAILABLE_TYPES=[['Twitter','Twitter'],['Gtalk','Gtalk'],['Jabber','Jabber']]
  belongs_to :contact
  validates_presence_of :name
  AVAILABLE_TYPES.each do |address_type|
    named_scope address_type.last.underscore.to_sym, :conditions => {:type => address_type.last}
  end
endg