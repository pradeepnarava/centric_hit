class Salesplan < ActiveRecord::Base
  belongs_to:customer
    belongs_to:serialize
    validates_presence_of:customer_id
     validates_presence_of:serialize_id
end
