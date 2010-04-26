class AddToSerializes < ActiveRecord::Migration
  def self.up
    add_column :serializes, :annealed_unannealed,:string
    add_column :serializes, :fincut_non_fincut, :string
    add_column :serializes, :end_condition, :string
    add_column :serializes, :packing_mode, :string
    remove_column:serializes,:unit_of_measure
    remove_column:serializes,:unit_mts
    remove_column:serializes,:unit_pcs
    remove_column:serializes,:unit_kgs
    add_column :serializes, :mat_type, :string
  end

  def self.down
  end
end
