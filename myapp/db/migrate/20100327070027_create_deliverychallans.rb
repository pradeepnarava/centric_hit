class CreateDeliverychallans < ActiveRecord::Migration
  def self.up
    create_table :deliverychallans do |t|
      t.string :delivery_challan_no
      t.datetime :date
      t.string :vehicle_no
      t.decimal :od
      t.decimal :length
      t.decimal :thickness
      t.integer :quantity_pcs
      t.integer :quantity_mtrs
      t.string :remark
      t.string :vat_tin
      t.string :cst_tin
      t.string :from
      t.string :to

      t.timestamps
    end
  end

  def self.down
    drop_table :deliverychallans
  end
end
