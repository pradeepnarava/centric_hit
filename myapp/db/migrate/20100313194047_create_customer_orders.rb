class CreateCustomerOrders < ActiveRecord::Migration
  def self.up
    create_table :customer_orders do |t|
      t.string :tube_size
      t.string :grade
      t.string :specification
      t.integer :unit_price
      t.integer :customer_id
      t.integer :serialize_id
      t.integer :quantity
      t.string :unit_of_measure
      t.string :tital_weight
      t.decimal :rate_per_kilo
      t.decimal :total_amount
      t.string :email
      t.string :office_address
      t.string :vat_no
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
