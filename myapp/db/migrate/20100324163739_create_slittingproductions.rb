class CreateSlittingproductions < ActiveRecord::Migration
  def self.up
    create_table :slittingproductions do |t|
      t.integer :rawmaterial_id
      t.integer :slitting_id
      t.datetime :shift
      t.string :operator_name
      t.string :source
      t.decimal :input_weight
      t.decimal :width
      t.decimal :thickness
      t.string :grade
      t.string :type
      t.integer :width_slitting
      t.integer :no_of_slits_slitting
      t.decimal :slit_coil_weight
      t.decimal :slit_weight
      t.decimal :scrap_weight
      t.string :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :slittingproductions
  end
end
