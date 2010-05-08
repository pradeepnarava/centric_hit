class AlterToPredespatchtcs < ActiveRecord::Migration
  def self.up
    add_column :predespatchtcs, :rawmaterial_id, :integer
    remove_column:predespatchtcs,:uncoiler_report_id
    
    
  end

  def self.down
    remove_column :predespatchtcs, :rawmaterial_id
    add_column :predespatchtcs,:uncoiler_report_id, :integer
  end
end
