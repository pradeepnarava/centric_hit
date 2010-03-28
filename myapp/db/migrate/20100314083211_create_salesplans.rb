class CreateSalesplans < ActiveRecord::Migration
  def self.up
    create_table :salesplans do |t|
      t.string :po_no
      t.string :customer_name
      t.integer :customer_id
      t.string :tube_size
      t.integer :serialize_id
      t.integer :quantity
      t.string :customer_code
      t.integer :pieces
      t.integer :meter
      t.integer :kilos

      t.timestamps
    end
  end

  def self.down
    drop_table :salesplans
  end
end
