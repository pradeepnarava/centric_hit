class AlertRawmaterialSlitting < ActiveRecord::Migration
  def self.up
    add_column :rawmaterials, :mother_id, :integer
    add_column :slittings, :slitt_rawmaterial_id ,:integer
    change_column_default :slittings, :division_part, 0
  end

  def self.down
    remove_column :rawmaterials, :mother_id
    remove_column :slittings, :slitt_rawmaterial_id
    change_column_default :slittings, :division_part, ""    
  end
end
