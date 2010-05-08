class ModifySpecification < ActiveRecord::Migration
  def self.up
    change_column(:specifications,:per_c,:decimal,:precision => 12, :scale => 3,:default => 0)
    change_column(:specifications,:per_mn,:decimal,:precision => 12, :scale => 3,:default => 0)
    change_column(:specifications,:per_s,:decimal,:precision => 12, :scale => 3,:default => 0)
    change_column(:specifications,:per_p,:decimal,:precision => 12, :scale => 3,:default => 0)
    change_column(:specifications,:per_si,:decimal,:precision => 12, :scale => 3,:default => 0)
    change_column(:specifications,:per_al,:decimal,:precision => 12, :scale => 3,:default => 0)
    change_column(:specifications,:per_ni,:decimal,:precision => 12, :scale => 3,:default => 0)
    change_column(:specifications,:per_cr,:decimal,:precision => 12, :scale => 3,:default => 0)
    remove_column :specifications,:ys
    remove_column :specifications,:ts
    remove_column :specifications,:hardness    
    remove_column :specifications,:el
    add_column :specifications, :ys, :string
    add_column :specifications, :ts, :string
    add_column :specifications, :el, :string
    add_column :specifications, :hardness, :string    
  end

  def self.down
  end
end
