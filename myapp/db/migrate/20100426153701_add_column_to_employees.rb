class AddColumnToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :address, :string
  end

  def self.down
    remove_column :employees, :address
  end
end
