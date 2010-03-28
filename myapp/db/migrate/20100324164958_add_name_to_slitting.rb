class AddNameToSlitting < ActiveRecord::Migration
  def self.up
    add_column :slittings, :slitting_coil_no, :string
  end

  def self.down
    remove_column :slittings, :slitting_coil_no
  end
end
