class AddColumnToSuppliers < ActiveRecord::Migration
  def self.up
    add_column :suppliers,:street, :string
    add_column :suppliers,:city, :string
    add_column :suppliers,:zipcode, :string
    add_column :suppliers,:state, :string
  end

  def self.down
    remove_column :suppliers,:street
    remove_column :suppliers,:city
    remove_column :suppliers,:zipcode
    remove_column :suppliers,:state
  end
end
