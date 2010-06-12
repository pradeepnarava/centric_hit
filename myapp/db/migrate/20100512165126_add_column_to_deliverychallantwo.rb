class AddColumnToDeliverychallantwo < ActiveRecord::Migration
  def self.up
    add_column:deliverychallans,:serialize_id,:integer
    remove_column:deliverychallans,:customer_order_id

    add_column :predespatchtcs, :tc_date, :datetime
    remove_column:predespatchtcs,:date   
  end

  def self.down
    remove_column:deliverychallans,:serialize_id
    add_column:deliverychallans,:customer_order_id,:integer

    add_column :predespatchtcs, :date, :datetime
    remove_column:predespatchtcs,:tc_date       
  end
end
