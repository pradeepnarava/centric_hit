class AddCustomerOrderIdToDeliverychallans < ActiveRecord::Migration
  def self.up
     add_column:deliverychallans,:customer_order_id,:integer
     #add_column:deliverychallans,:customer_id,:integer
     add_column:predespatchtcs,:specification_id,:integer
     remove_column:predespatchtcs,:specification
  end

  def self.down
     remove_column:deliverychallans,:customer_order_id
     #remove_column:deliverychallans,:customer_id
     remove_column:predespatchtcs,:specification_id
  end
end
