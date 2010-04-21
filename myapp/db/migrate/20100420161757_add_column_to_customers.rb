class AddColumnToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :customer_code, :string
    add_column :customers, :address_delivery,:string
    add_column :customers, :fax_no,:string
    add_column :customers, :range,:string
    add_column :customers, :division,:string
    add_column :customers, :collectorate,:string
    add_column :customers, :ecc_no,:string
    add_column :customers, :ifc_no,:string
    add_column :customers, :dgft_code,:string
    add_column :customers, :service_tax_reg,:string
    add_column :customers, :gta_red_no,:string
    add_column :customers, :bank_ac_no,:string
  end

  def self.down
    remove_column :customers, :customer_code
    add_column :customers, :address_delivery,:string
    remove_column :customers, :fax_no,:string
    remove_column :customers, :range,:string
    remove_column :customers, :division,:string
    remove_column :customers, :collectorate,:string
    remove_column :customers, :ecc_no,:string
    remove_column :customers, :ifc_no,:string
    remove_column :customers, :dgft_code,:string
    remove_column :customers, :service_tax_reg,:string
    remove_column :customers, :gta_red_no,:string
    remove_column :customers, :bank_ac_no,:string
  end
end
