class Customer < ActiveRecord::Base
  has_many:customer_orders
  has_many:salesplans
  has_many:predespatchtcs
end
