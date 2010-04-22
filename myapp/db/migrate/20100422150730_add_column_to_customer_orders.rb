class AddColumnToCustomerOrders < ActiveRecord::Migration
  def self.up
    add_column :customer_orders, :rate_mts, :decimal
    add_column :customer_orders, :rate_pcs, :decimal
    add_column :customer_orders, :rate_kgs, :decimal
  end

  def self.down
    remove_column :customer_orders, :rate_kgs
    remove_column :customer_orders, :rate_pcs
    remove_column :customer_orders, :rate_mts
  end
end
