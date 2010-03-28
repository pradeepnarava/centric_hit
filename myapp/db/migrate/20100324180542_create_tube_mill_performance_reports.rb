class CreateTubeMillPerformanceReports < ActiveRecord::Migration
  def self.up
    create_table :tube_mill_performance_reports do |t|
      t.string :lot_no
      t.integer :customer_id
      t.string :od_width
      t.decimal :id_height
      t.decimal :thickness
      t.decimal :length
      t.decimal :id_fin_height
      t.string :drifting
      t.string :flattening
      t.string :specification
      t.string :rm_grade
      t.integer :slittingproduction_id
      t.string :spl_requirement
      t.datetime :date
      t.datetime :shift
      t.string :operator_name
      t.string :inspector_name
      t.decimal :open
      t.decimal :joint
      t.decimal :tool_mark
      t.decimal :roll_mark
      t.decimal :pick_up
      t.decimal :scratch
      t.decimal :week_weld
      t.decimal :bend
      t.decimal :nf_c
      t.string :remarks
      t.integer :lot_numbers

      t.timestamps
    end
  end

  def self.down
    drop_table :tube_mill_performance_reports
  end
end
