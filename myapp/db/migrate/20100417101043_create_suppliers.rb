class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :po_no
      t.string :sales_order_no
      t.string :test_certificate_no
      t.datetime :date
      t.string :invoice_no
      t.string :coil_packet_no
      t.string :t_w_l
      t.integer :no_of_sheets
      t.string :grade
      t.decimal :net_weight
      t.decimal :c
      t.decimal :v
      t.decimal :mn
      t.decimal :cu
      t.decimal :s
      t.decimal :nb
      t.decimal :p
      t.decimal :cr
      t.decimal :al
      t.decimal :ni
      t.decimal :si
      t.decimal :ti
      t.decimal :n
      t.decimal :ys
      t.decimal :u_t_s
      t.decimal :el_on_gl
      t.decimal :hrb
      t.decimal :vpn
      t.decimal :ecv
      t.decimal :n_value
      t.decimal :r_bar
      t.string :bend_test
      t.string :bright_matt
      t.decimal :ra
      t.integer :do_item_wise

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
