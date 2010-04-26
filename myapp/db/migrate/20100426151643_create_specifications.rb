class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.string :specification_name
      t.string :grade
      t.decimal :per_c
      t.decimal :per_mn
      t.decimal :per_s
      t.decimal :per_p
      t.decimal :per_si
      t.decimal :per_al
      t.decimal :per_ni
      t.decimal :per_cr
      t.decimal :ys
      t.decimal :ts
      t.decimal :el
      t.decimal :hardness
      t.string :od_width
      t.string :id_height
      t.string :thick
      t.string :length
      t.string :flaring
      t.string :flattening
      t.string :bending
      t.string :crushing
      t.string :bend
      t.string :corner_radius
      t.string :squareness
      t.string :twist

      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end
