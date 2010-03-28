class AddNameToSlittingproduction < ActiveRecord::Migration
  def self.up
    add_column :slittingproductions, :slitting_coil_no, :string
  end

  def self.down
    remove_column :slittingproductions, :slitting_coil_no
  end
end
