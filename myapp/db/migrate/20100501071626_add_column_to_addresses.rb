class AddColumnToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses,:street, :string
    add_column :addresses,:city, :string
    add_column :addresses,:zipcode, :string
    add_column :addresses,:state, :string
    add_column :addresses,:address, :string
  end

  def self.down
    remove_column :addresses,:street
    remove_column :addresses,:city
    remove_column :addresses,:zipcode
    remove_column :addresses,:state
    remove_column :addresses,:address
  end
end
