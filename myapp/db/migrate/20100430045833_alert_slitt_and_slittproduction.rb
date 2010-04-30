class AlertSlittAndSlittproduction < ActiveRecord::Migration
  def self.up
    #Slittingproduction
    add_column :slittingproductions, :production_date, :datetime
    remove_column :slittingproductions, :shift
    add_column :slittingproductions, :shift, :string
    remove_column :slittingproductions, :source
    remove_column :slittingproductions, :no_of_slits_slitting
    
    
    #Slitting
    add_column :slittings, :status, :integer, :default => 0
    add_column :slittings, :produced_no_of_slit, :integer, :default => 0
    
    
  end

  def self.down
    #Slittingproduction
    remove_column :slittingproductions, :production_date
    remove_column :slittingproductions, :shift
    add_column :slittingproductions, :shift, :datetime
    add_column :slittingproductions, :source ,:string
    add_column :slittingproductions, :no_of_slits_slitting, :integer
    
    
    #Slitting
    remove_column :slittings, :status
    remove_column :slittings, :produced_no_of_slit
  end
end
