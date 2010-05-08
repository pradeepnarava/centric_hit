class CustomerOrder < ActiveRecord::Base
  belongs_to :customer
  belongs_to :serialize
  has_many:deliverychallans

   #has_many :customer_order_serializes
   #has_many :serializes,:through=>:customer_order_serializes, :uniq => true

  
  validates_presence_of :tube_size
end
