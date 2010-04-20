class CreateSlittings < ActiveRecord::Migration
  def self.up
    create_table :slittings do |t|
      t.integer :rawmaterial_id
      t.integer :division_part
      t.string :scrap
      t.decimal :slit_width
      t.decimal :slit_weight
      t.integer :no_of_slits
      t.decimal :weight
      t.string :remarks
      t.string :process_coil_wt
      t.timestamps
    end
  end

  def self.down
    drop_table :slittings
  end
end
