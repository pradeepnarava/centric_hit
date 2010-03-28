class CreateTubeMillStoppageReports < ActiveRecord::Migration
  def self.up
    create_table :tube_mill_stoppage_reports do |t|
      t.datetime :date
      t.datetime :shift
      t.decimal :size
      t.string :customer
      t.string :description_of_breakdown
      t.string :type
      t.string :stoppage_code
      t.datetime :from
      t.datetime :to
      t.string :total_time
      t.string :remarks
      t.string :electrical_maintainence
      t.string :mechanical_maintainence
      t.string :operational
      t.string :roll_change
      t.string :raw_material_shortage
      t.string :man_power_shortage
      t.string :crane_delay
      t.string :power_failure
      t.string :remarks_last
      t.string :shift_incharge

      t.timestamps
    end
  end

  def self.down
    drop_table :tube_mill_stoppage_reports
  end
end
