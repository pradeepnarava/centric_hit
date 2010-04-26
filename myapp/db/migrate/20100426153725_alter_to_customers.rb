class AlterToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :vat, :string
    add_column :customers, :cst, :string
    add_column :customers, :pin, :string
    add_column :customers, :street, :string
    add_column :customers, :state, :string
    add_column :customers, :city, :string
    remove_column:customers,:delivery
    remove_column:customers,:taxes

  end

  def self.down
    remove_column :customers, :vat 
    remove_column :customers, :cst
    remove_column :customers, :pin
    remove_column :customers, :street
    remove_column :customers, :state
    remove_column :customers, :city
    add_column:customers,:delivery,:string
    add_column:customers,:taxes,:string

  end
end
