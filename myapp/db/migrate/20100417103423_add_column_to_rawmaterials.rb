class AddColumnToRawmaterials < ActiveRecord::Migration
  def self.up
    add_column :rawmaterials, :supplier_id, :integer
  end

  def self.down
    remove_column  :rawmaterials, :supplier_id
  end
end
