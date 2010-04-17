class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :customer_name
      t.decimal :od
      t.decimal :id
      t.string :thickness
      t.string :length
      t.string :part_number
      t.string :is
      t.string :astm
      t.string :din
      t.string :jis
      t.boolean :automotive
      t.boolean :newprogram
      t.boolean :sop
      t.boolean :existing
      t.boolean :gen_engg
      t.boolean :boiler_air_heat
      t.boolean :furniture
      t.string :cut_chamf
      t.string :press_operations
      t.string :machining
      t.string :plating
      t.decimal :meters
      t.decimal :tons
      t.decimal :od_tol
      t.decimal :id_tol
      t.decimal :thick_tol
      t.decimal :length_tol
      t.string :id_fin_cut
      t.decimal :id_fin_height
      t.decimal :id_surface
      t.decimal :straightness
      t.decimal :od_surface_finish
      t.boolean :ect
      t.decimal :pressure_testing
      t.decimal :corner_radius
      t.decimal :uts
      t.decimal :ys
      t.decimal :elongation
      t.string :special_characteristics
      t.string :spc_requirement
      t.string :remarks
      t.string :name
      t.string :designation
      t.string :enclosures

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
