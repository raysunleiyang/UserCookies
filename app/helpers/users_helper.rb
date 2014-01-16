require 'uuidtools'
module UsersHelper
   def uuid_create  
    self.uuid = UUIDTools::UUID.timestamp_create().to_s  
  end  
end
