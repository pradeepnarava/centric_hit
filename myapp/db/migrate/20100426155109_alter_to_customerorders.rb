class AlterToCustomerorders < ActiveRecord::Migration
  def self.up
    add_column :customer_orders, :po_date, :datetime
    rename_column:customer_orders,:rate_mts,:rate_mtr
    rename_column:customer_orders,:rate_kgs,:rate_mt
    change_column :customer_orders,:rate_mtr,:decimal,:precision => 12, :scale => 3,:default => 0
    change_column :customer_orders,:rate_mt,:decimal,:precision => 12, :scale => 3,:default => 0
    change_column :customer_orders,:rate_pcs,:decimal,:precision => 12, :scale => 3,:default => 0
    add_column :customer_orders,:qty_mtr,:decimal,:precision => 12, :scale => 3,:default => 0
    add_column :customer_orders,:qty_mt,:decimal,:precision => 12, :scale => 3,:default => 0
    add_column :customer_orders,:qty_pcs,:decimal,:precision => 12, :scale => 3,:default => 0
    change_column :customer_orders,:tube_size,:string
    #specification_id is added to serializes here itself as foreign key
    remove_column:serializes,:specification
    add_column :serializes,:specification_id,:integer

  end

  def self.down
  end
end
