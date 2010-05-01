class AlertDecimalValues < ActiveRecord::Migration
  def self.up
    # Uncoiler_reports
    remove_column :uncoiler_reports, :shift
    add_column :uncoiler_reports, :shift, :string

    # Tubemillperformance_reports
    remove_column :tube_mill_performance_reports, :shift
    add_column :tube_mill_performance_reports, :shift, :string
    
    # Uncoiler_reports
    change_column(:uncoiler_reports,:width_actual,:decimal,:precision => 12, :scale => 3,:default => 0) 
    change_column(:uncoiler_reports,:thickness_actual,:decimal,:precision => 12, :scale => 3,:default => 0)
      remove_column :uncoiler_reports, :type_actual
    add_column(:uncoiler_reports,:type_actual,:decimal,:precision => 12, :scale => 3,:default => 0)
    
    # Slittingproductions
    change_column(:slittingproductions,:input_weight,:decimal,:precision => 12, :scale => 3,:default => 0) 
    change_column(:slittingproductions,:width,:decimal,:precision => 12, :scale => 3,:default => 0) 
    change_column(:slittingproductions,:thickness,:decimal,:precision => 12, :scale => 3,:default => 0) 
    remove_column :slittingproductions,:width_slitting
    add_column(:slittingproductions,:width_slitting,:decimal,:precision => 12, :scale => 3,:default => 0) 
    change_column(:slittingproductions,:slit_coil_weight,:decimal,:precision => 12, :scale => 3,:default => 0) 
    change_column(:slittingproductions,:slit_weight,:decimal,:precision => 12, :scale => 3,:default => 0) 
    change_column(:slittingproductions,:scrap_weight,:decimal,:precision => 12, :scale => 3,:default => 0) 
    
  end

  def self.down
    # Uncoiler_reports
    remove_column :uncoiler_reports, :shift
    add_column :uncoiler_reports, :shift, :datetime

    # Tubemillperformance_reports
    remove_column :tube_mill_performance_reports, :shift
    add_column :tube_mill_performance_reports, :shift, :time
    
    # Uncoiler_reports
    change_column(:uncoiler_reports,:width_actual,:decimal) 
    change_column(:uncoiler_reports,:thickness_actual,:decimal) 
    change_column(:uncoiler_reports,:type_actual,:decimal) 
    
    # Slittingproductions
    change_column(:slittingproductions,:input_weight,:decimal) 
    change_column(:slittingproductions,:width,:decimal) 
    change_column(:slittingproductions,:thickness,:decimal) 
    remove_column :slittingproductions,:width_slitting
    add_column(:slittingproductions,:width_slitting,:integer) 
    change_column(:slittingproductions,:slit_coil_weight,:decimal) 
    change_column(:slittingproductions,:slit_weight,:decimal) 
    change_column(:slittingproductions,:scrap_weight,:decimal) 
        
  end
end
