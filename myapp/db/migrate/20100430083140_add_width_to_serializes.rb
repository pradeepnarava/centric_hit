class AddWidthToSerializes < ActiveRecord::Migration
  def self.up
    add_column :serializes, :width, :decimal
  end

  def self.down
    remove_column :serializes, :width
  end
end
