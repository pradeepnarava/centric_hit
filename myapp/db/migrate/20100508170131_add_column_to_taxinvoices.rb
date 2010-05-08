class AddColumnToTaxinvoices < ActiveRecord::Migration
  def self.up
    add_column:taxinvoices,:deliverychallan_id,:integer

  end

  def self.down
    remove_column:taxinvoices,:deliverychallan_id

  end
end
