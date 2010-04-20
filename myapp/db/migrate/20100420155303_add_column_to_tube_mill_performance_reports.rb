class AddColumnToTubeMillPerformanceReports < ActiveRecord::Migration
  def self.up
    add_column :tube_mill_performance_reports, :status, :integer
  end

  def self.down
    remove_column :tube_mill_performance_reports, :status
  end
end
