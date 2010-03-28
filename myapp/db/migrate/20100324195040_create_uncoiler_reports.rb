class CreateUncoilerReports < ActiveRecord::Migration
  def self.up
    create_table :uncoiler_reports do |t|
      t.datetime :date
      t.datetime :shift
      t.string :operator_name
      t.integer :slittingproduction_id
      t.decimal :tube_od
      t.decimal :width
      t.decimal :thickness
      t.string :grade
      t.string :type
      t.decimal :width_actual
      t.decimal :thickness_actual
      t.string :grade_actual
      t.string :type_actual

      t.timestamps
    end
  end

  def self.down
    drop_table :uncoiler_reports
  end
end
