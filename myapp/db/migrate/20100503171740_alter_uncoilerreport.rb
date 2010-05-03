class AlterUncoilerreport < ActiveRecord::Migration
  def self.up
    remove_column :uncoiler_reports,:operator_name
    add_column :uncoiler_reports,:operator_id,:integer
  end

  def self.down
    remove_column :uncoiler_reports,:operator_id
    add_column :uncoiler_reports,:operator_name,:string
  end
end
