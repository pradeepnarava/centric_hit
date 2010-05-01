class Deliverychallan < ActiveRecord::Base
 belongs_to :customer
 belongs_to :customer_order
 validates_presence_of :cst_tin
end
