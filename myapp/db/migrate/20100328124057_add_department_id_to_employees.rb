class AddDepartmentIdToEmployees < ActiveRecord::Migration
  def self.up
    add_column :serializes, :customer_id, :integer
  end

  def self.down
    remove_column :serializes, :customer_id
  end
     
end
