class CreateTaxinvoices < ActiveRecord::Migration
  def self.up
    create_table :taxinvoices do |t|
      t.decimal :od
      t.decimal :thickness
      t.decimal :length
      t.string :description
      t.string :average_content_packets
      t.integer :pieces
      t.decimal :meters
      t.decimal :rs_mtrs
      t.decimal :rs_mtrs
      t.decimal :total_tariff_value
      t.decimal :rate_of_duty
      t.decimal :total_duty
      t.decimal :amount
      t.decimal :total_all
      t.decimal :excise_duty
      t.decimal :ed_cess
      t.decimal :sah_ed_cess
      t.decimal :vat_cst
      t.decimal :packing_forwarding
      t.decimal :grand_total
      t.string :vat_tin_no
      t.string :cst_tin_no
      t.string :part_vat_no
      t.string :party_cst_no
      t.string :pan_entry_no
      t.string :date_of_debit_entry_no
      t.string :entry_of_duty_entry_no
      t.datetime :date_and_time_of_goods
      t.string :range
      t.string :range_two
      t.string :ecc_no
      t.string :notification_no
      t.datetime :date_of_preparation_invoice
      t.datetime :timeof_invoice
      t.string :po_no
      t.string :invoice_no
      t.string :challan_no
      t.string :vehicle_no
      t.string :lr_no
      t.datetime :date_po
      t.datetime :date_invoice_no
      t.datetime :date_challan_no
      t.string :name_and_adress_of_buyor
      t.string :name_and_adress_of_consignee
      t.integer :chapter_heading_no
      t.string :name_of_deliver_goods
      t.string :pan_no
      t.string :commissionarate
      t.string :in_words

      t.timestamps
    end
  end

  def self.down
    drop_table :taxinvoices
  end
end
