class AddToSalesplanagain < ActiveRecord::Migration
  def self.up
    add_column:salesplans,:order_wt,:decimal,:precision => 12, :scale => 4,:default => 0
    add_column:salesplans,:stock_quantity,:integer
    add_column:salesplans,:stock_wt,:decimal,:precision => 12, :scale => 4,:default => 0
    add_column:salesplans,:balance_quantity,:integer
    add_column:salesplans,:balance_wt,:decimal,:precision => 12, :scale => 4,:default => 0
    remove_column:salesplans,:quantity
    add_column:salesplans,:order_quantity,:integer
  end

  def self.down
    remove_column:salesplans,:order_wt
    remove_column:salesplans,:stock_quantity
    remove_column:salesplans,:stock_wt
    remove_column:salesplans,:balance_quantity
    remove_column:salesplans,:balance_wt
    remove_column:salesplans,:order_quantity
  end
 
end
