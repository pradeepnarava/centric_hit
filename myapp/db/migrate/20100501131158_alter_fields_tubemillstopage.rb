class AlterFieldsTubemillstopage < ActiveRecord::Migration
  def self.up
    remove_column :tube_mill_stoppage_reports, :customer
    remove_column :tube_mill_stoppage_reports, :stoppage_code
    remove_column :tube_mill_stoppage_reports, :remarks_last
    remove_column :tube_mill_stoppage_reports, :shift
    add_column :tube_mill_stoppage_reports, :shift ,:string
    change_column :tube_mill_stoppage_reports, :from, :time
    change_column :tube_mill_stoppage_reports, :to, :time
    remove_column :tube_mill_stoppage_reports, :type_stop
    add_column :tube_mill_stoppage_reports, :type_stop ,:integer
    
    
  end

  def self.down
    add_column :tube_mill_stoppage_reports, :customer,:string
    add_column :tube_mill_stoppage_reports, :stoppage_code,:string
    add_column :tube_mill_stoppage_reports, :remarks_last,:string
    remove_column :tube_mill_stoppage_reports, :shift
    add_column :tube_mill_stoppage_reports, :shift ,:datetime
    change_column :tube_mill_stoppage_reports, :from, :datetime
    change_column :tube_mill_stoppage_reports, :to, :datetime    
    remove_column :tube_mill_stoppage_reports, :type_stop
    add_column :tube_mill_stoppage_reports, :type_stop ,:string    
  end
end
