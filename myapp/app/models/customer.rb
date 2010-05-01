class Customer < ActiveRecord::Base
  has_many:customer_orders
  has_many:salesplans
  has_many:predespatchtcs
  has_many:deliverychallans
  has_many:taxinvoices
  has_many:serializes
  
end
