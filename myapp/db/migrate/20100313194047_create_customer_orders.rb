class CreateCustomerOrders < ActiveRecord::Migration
  def self.up
    create_table :customer_orders do |t|
      t.decimal :tube_size,  :precision => 10, :scale => 4
      t.integer :customer_id
      t.integer :serialize_id
      t.integer :quantity

      t.decimal :total_weight,  :precision => 10, :scale => 4
      t.decimal :rate_per_kilo,  :precision => 10, :scale => 4
      t.decimal :total_amount,  :precision => 10, :scale => 4
      t.string :ecc_no
      t.string :delivery_address
      t.string :po_no

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_orders
  end
end
