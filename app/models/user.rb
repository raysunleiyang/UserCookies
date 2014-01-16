#require 'uuidtools' 
include UsersHelper 
 class User < ActiveRecord::Base
  #set_primary_key "uuid"
  #self.primary_key="uuid"
  #before_create:uuid_create
  
  has_many :histories, :class_name => "History", :foreign_key => "uuid", :dependent => :destroy
  has_many :tags,:class_name => "Tag", :foreign_key => "uuid", :dependent => :destroy
  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:tag].blank? }, :allow_destroy => true
  
end
