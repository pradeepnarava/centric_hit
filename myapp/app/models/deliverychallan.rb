class Deliverychallan < ActiveRecord::Base
 belongs_to :customer
 belongs_to :customer_order
 has_many:taxinvoices
 validates_presence_of :customer_order_id
end
