class AddColumnToDeliverychallantwo < ActiveRecord::Migration
  def self.up
    add_column:deliverychallans,:serialize_id,:integer
    remove_column:deliverychallans,:customer_order_id
  end

  def self.down
    remove_column:deliverychallans,:serialize_id
     add_column:deliverychallans,:customer_order_id,:integer
  end
end
