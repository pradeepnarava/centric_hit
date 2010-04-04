class AddcolumnsToSerialize < ActiveRecord::Migration
  def self.up
    add_column :serializes, :od, :decimal,  :precision => 10, :scale => 4
    add_column :serializes, :thikness, :decimal,  :precision => 10, :scale => 4
    add_column :serializes, :length, :decimal,  :precision => 10, :scale => 4
    add_column :serializes, :grade, :string    
    add_column :serializes, :specification, :string
    add_column :serializes, :unit_of_measure, :string

  end

  def self.down
    remove_column  :od, :decimal
    remove_column  :thikness, :decimal
    remove_column  :length, :decimal
    remove_column  :grade, :string    
    remove_column  :specification, :string    
    remove_column  :unit_of_measure, :string        
  end
end
