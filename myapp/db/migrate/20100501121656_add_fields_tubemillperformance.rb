class AddFieldsTubemillperformance < ActiveRecord::Migration
  def self.up
    add_column :tube_mill_performance_reports, :no_of_tube, :integer
    remove_column :tube_mill_performance_reports, :lot_no
    add_column :tube_mill_performance_reports, :lot_no , :integer
    
  end

  def self.down
    remove_column :tube_mill_performance_reports, :no_of_tube
    remove_column :tube_mill_performance_reports, :lot_no
    add_column :tube_mill_performance_reports, :lot_no , :decimal
  end
end
