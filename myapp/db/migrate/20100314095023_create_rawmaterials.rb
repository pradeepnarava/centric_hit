class CreateRawmaterials < ActiveRecord::Migration
  def self.up
    create_table :rawmaterials do |t|
      t.string :name, :null => false
      t.string :width, :null => false
      t.string :thickness, :null => false
      t.string :coil_weight, :null => false
      t.integer :rawmaterial_category_id, :null => false
      t.integer :status, :limit => 1 ,:default => 0
      t.string :grade
      t.datetime :dateofreciept
      t.timestamps
    end
  end

  def self.down
    drop_table :rawmaterials
  end
end
