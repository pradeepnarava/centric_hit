class AddCustomerIdToTcTaxInvoice < ActiveRecord::Migration
  def self.up
    add_column :taxinvoices, :customer_id, :integer
  end

  def self.down
    remove_column :taxinvoices, :customer_id
  end
end
