class AddTermsToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :taxes, :string
    add_column :customers, :excise_duty, :string
    add_column :customers, :delivery, :string
    add_column :customers, :payment, :string
    add_column :customers, :octra, :string
  end

  def self.down
    remove_column :customers, :octra
    remove_column :customers, :payment
    remove_column :customers, :delivery
    remove_column :customers, :excise_duty
    remove_column :customers, :taxes
  end
end
