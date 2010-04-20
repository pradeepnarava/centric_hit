class AddColumnToSerializes < ActiveRecord::Migration
  def self.up
      add_column :serializes, :length, :string
  end

  def self.down
      remove_column :serializes, :length
  end
end
