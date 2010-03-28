class CreatePredespatchtcs < ActiveRecord::Migration
  def self.up
    create_table :predespatchtcs do |t|
      t.string :test_certificate_no
      t.integer :taxinvoice_id
      t.integer :customer_id
      t.datetime :date
      t.decimal :od
      t.decimal :thickness
      t.decimal :length
      t.integer :quantity
      t.string :specification
      t.string :grade
      t.string :fin_condition
      t.string :uann_ann
      t.decimal :c_spec
      t.integer :c_obs
      t.decimal :mn_spec
      t.decimal :mn_obs
      t.decimal :s_spec
      t.decimal :s_obs
      t.decimal :p_spec
      t.decimal :p_obs
      t.decimal :si_spec
      t.decimal :si_obs
      t.decimal :al_spec
      t.decimal :al_obs
      t.decimal :ni_spec
      t.decimal :ni_obs
      t.decimal :cr_spec
      t.decimal :cr_obs
      t.decimal :ys_spec
      t.decimal :ys_obs
      t.decimal :ts_obs
      t.decimal :ts_spec
      t.decimal :el_spec
      t.decimal :el_obs
      t.decimal :gl_hardness_spec
      t.decimal :el_hardness_obs
      t.decimal :od_spec
      t.decimal :od_obs
      t.decimal :id_spec
      t.decimal :id_obs
      t.decimal :thick_spec
      t.decimal :thick_obs
      t.decimal :length_spec
      t.decimal :length_obs
      t.string :scratch_mark
      t.string :roll_pick_up
      t.string :pits_dents
      t.string :bend
      t.string :corner_radius
      t.string :squareness
      t.string :twist
      t.string :flaring_spec
      t.string :flaring_obs
      t.string :flattening_obs
      t.string :flattening_spec
      t.string :bending_spec
      t.string :bending_obs
      t.string :crushing_spec
      t.string :crushing_obs
      t.integer :uncoiler_report_id
      t.integer :slittingproduction_id
      t.string :inspected_by
      t.string :approved_by
      t.integer :tube_mill_performance_report_id

      t.timestamps
    end
  end

  def self.down
    drop_table :predespatchtcs
  end
end
