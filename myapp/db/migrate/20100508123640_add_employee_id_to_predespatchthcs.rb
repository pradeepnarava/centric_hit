class AddEmployeeIdToPredespatchthcs < ActiveRecord::Migration
  def self.up
     add_column:predespatchtcs,:employee_id,:integer
  end

  def self.down
     remove_column:predespatchtcs,:employee_id
  end
end
