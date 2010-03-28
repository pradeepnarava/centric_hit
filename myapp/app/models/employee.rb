class Employee < ActiveRecord::Base
  belongs_to:department
   validates_presence_of:first_name
    validates_presence_of:last_name
    
end
