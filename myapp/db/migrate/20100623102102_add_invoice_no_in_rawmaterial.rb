class AddInvoiceNoInRawmaterial < ActiveRecord::Migration
  def self.up
    add_column :rawmaterials, :invoice_no, :string
  end

  def self.down
    remove_column :rawmaterials, :invoice_no
  end
end
