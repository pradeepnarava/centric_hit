class AddColumnToAgainSerializes < ActiveRecord::Migration
  def self.up
    add_column :serializes, :unit_mts, :decimal
    add_column :serializes, :unit_pcs, :decimal
    add_column :serializes, :unit_kgs, :decimal
  end

  def self.down
    remove_column :serializes, :unit_kgs
    remove_column :serializes, :unit_pcs
    remove_column :serializes, :unit_mts
  end
end
