class AddColumnToSalesplans < ActiveRecord::Migration
  def self.up
    remove_column :salesplans, :po_no
    remove_column :salesplans, :customer_name
    remove_column :salesplans, :tube_size
    remove_column :salesplans, :customer_code
    remove_column :salesplans, :pieces
    remove_column :salesplans, :meter
    remove_column :salesplans, :kilos
    add_column:salesplans,:od,:decimal
    add_column:salesplans,:length,:decimal
    add_column:salesplans,:thikness,:decimal

  end

  def self.down
    remove_column:salesplans,:od
    remove_column:salesplans,:length
    remove_column:salesplans,:thikness
  end
end
