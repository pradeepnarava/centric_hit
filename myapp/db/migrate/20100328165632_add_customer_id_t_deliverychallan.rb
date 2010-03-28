class AddCustomerIdTDeliverychallan < ActiveRecord::Migration
  def self.up
    add_column :deliverychallans, :customer_id, :integer
  end

  def self.down
     remove_column :deliverychallans, :customer_id
  end
end
