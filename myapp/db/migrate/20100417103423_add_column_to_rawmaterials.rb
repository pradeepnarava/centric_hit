class AddColumnToRawmaterials < ActiveRecord::Migration
  def self.up
    add_column :rawmaterials, :address_id, :integer
  end

  def self.down
    remove_column  :rawmaterials, :address_id
  end
end
