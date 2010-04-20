class AddColumnToCustomers < ActiveRecord::Migration
  def self.up
     add_column :customers, :customer_code, :string
  end

  def self.down
     remove_column :customers, :customer_code
  end
end
