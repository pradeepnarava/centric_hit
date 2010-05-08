class RemoveColumnFromCustomerOrders < ActiveRecord::Migration
  def self.up
     add_column:customer_orders,:balance,:integer
     add_column:customer_orders,:status,:integer
     add_column:customer_orders,:vat_no,:string
   
  end

  def self.down
  end
end
