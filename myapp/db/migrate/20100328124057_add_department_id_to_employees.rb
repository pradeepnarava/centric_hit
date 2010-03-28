class AddDepartmentIdToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :department_id, :integer
  end

  def self.down
  end
     remove_column :employees, :department_id
end
