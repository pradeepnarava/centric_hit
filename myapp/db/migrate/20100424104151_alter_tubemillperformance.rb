class AlterTubemillperformance < ActiveRecord::Migration
  def self.up
    remove_column(:tube_mill_performance_reports, :lot_no)
    remove_column(:tube_mill_performance_reports, :week_weld)
    remove_column(:tube_mill_performance_reports, :lot_numbers)
    add_column(:tube_mill_performance_reports,:lot_no,:decimal,:precision => 12, :scale => 4,:default => 0)
    add_column(:tube_mill_performance_reports,:weak_weld,:decimal,:precision => 12, :scale => 4,:default => 0)    
    change_column(:tube_mill_performance_reports,:id_height,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:thickness,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:length,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:id_fin_height,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:open,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:joint,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:tool_mark,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:roll_mark,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:pick_up,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:scratch,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:bend,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:nf_c,:decimal,:precision => 12, :scale => 4,:default => 0) 
    change_column(:tube_mill_performance_reports,:shift,:time) 
   
  end

  def self.down
    remove_column(:tube_mill_performance_reports, :lot_no)
    remove_column(:tube_mill_performance_reports, :weak_weld)
    add_column(:tube_mill_performance_reports,:lot_no,:string)
    add_column(:tube_mill_performance_reports,:week_weld,:decimal)    
    add_column(:tube_mill_performance_reports,:lot_numbers,:integer)    
    change_column(:tube_mill_performance_reports,:id_height,:decimal) 
    change_column(:tube_mill_performance_reports,:thickness,:decimal) 
    change_column(:tube_mill_performance_reports,:length,:decimal) 
    change_column(:tube_mill_performance_reports,:id_fin_height,:decimal) 
    change_column(:tube_mill_performance_reports,:open,:decimal) 
    change_column(:tube_mill_performance_reports,:joint,:decimal) 
    change_column(:tube_mill_performance_reports,:tool_mark,:decimal) 
    change_column(:tube_mill_performance_reports,:roll_mark,:decimal) 
    change_column(:tube_mill_performance_reports,:pick_up,:decimal) 
    change_column(:tube_mill_performance_reports,:scratch,:decimal) 
    change_column(:tube_mill_performance_reports,:bend,:decimal) 
    change_column(:tube_mill_performance_reports,:nf_c,:decimal) 
    change_column(:tube_mill_performance_reports,:shift,:datetime)     
  end
end
