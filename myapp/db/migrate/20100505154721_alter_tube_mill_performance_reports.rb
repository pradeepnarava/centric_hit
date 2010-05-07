class AlterTubeMillPerformanceReports < ActiveRecord::Migration
  def self.up
    remove_column :tube_mill_performance_reports,:operator_name
    remove_column :tube_mill_performance_reports,:inspector_name
    add_column :tube_mill_performance_reports,:operator_id,:integer
    add_column :tube_mill_performance_reports,:inspector_id,:integer
  end

  def self.down
    remove_column :tube_mill_performance_reports,:operator_id
    remove_column :tube_mill_performance_reports,:inspector_id
    add_column :tube_mill_performance_reports,:operator_name,:string
    add_column :tube_mill_performance_reports,:inspector_name,:string
  end
end
