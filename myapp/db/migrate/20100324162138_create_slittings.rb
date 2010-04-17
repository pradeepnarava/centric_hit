class CreateSlittings < ActiveRecord::Migration
  def self.up
    create_table :slittings do |t|
      t.integer :rawmaterial_id
      t.integer :side_trim
      t.string :scrap
      t.decimal :slit_width
      t.decimal :slit_weight
      t.integer :no_of_slits
      t.decimal :weight
      t.string :remarks
      t.string :slitting_coil_no

      t.timestamps
    end
  end

  def self.down
    drop_table :slittings
  end
end
