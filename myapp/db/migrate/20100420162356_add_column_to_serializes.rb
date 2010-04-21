class AddColumnToSerializes < ActiveRecord::Migration
  def self.up
      add_column :serializes, :height, :string
  end

  def self.down
      remove_column :serializes, :height
  end
end
