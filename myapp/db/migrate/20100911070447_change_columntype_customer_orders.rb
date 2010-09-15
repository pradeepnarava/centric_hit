class ChangeColumntypeCustomerOrders < ActiveRecord::Migration
  def self.up
    change_column(:customer_orders,:total_amount,:decimal,:precision => 13, :scale => 2)
  end

  def self.down
    change_column(:customer_orders,:total_amount,:decimal,:precision => 10, :scale => 4)
  end
end
