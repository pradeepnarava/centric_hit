class Serialize < ActiveRecord::Base
  has_many:customer_orders
  belongs_to:customer
end
