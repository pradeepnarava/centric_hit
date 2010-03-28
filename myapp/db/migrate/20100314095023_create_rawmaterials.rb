class CreateRawmaterials < ActiveRecord::Migration
  def self.up
    create_table :rawmaterials do |t|
      t.string :name
      t.string :grade
      t.string :width
      t.string :thickness
      t.string :coil_weight
      t.string :grade
      t.string :type
      t.integer :rawmaterial_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rawmaterials
  end
end
