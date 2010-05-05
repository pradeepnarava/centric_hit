class AlterSlittingplan < ActiveRecord::Migration
  def self.up
    change_column(:slittings,:slit_width,:decimal,:precision => 12, :scale => 3,:default => 0)
    change_column(:slittings,:slit_weight,:decimal,:precision => 12, :scale => 3,:default => 0)
    remove_column :slittings,:weight
    add_column :slittings,:total_weight,:decimal,:precision => 12, :scale => 3,:default => 0
    
    remove_column :slittingproductions,:operator_name
    add_column :slittingproductions,:operator_id,:integer    
  end

  def self.down
  end
end
