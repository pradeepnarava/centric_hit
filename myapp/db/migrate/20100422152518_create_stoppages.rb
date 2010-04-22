class CreateStoppages < ActiveRecord::Migration
  def self.up
    create_table :stoppages do |t|
      t.string :name
      t.integer :type_stop

      t.timestamps
    end
  end

  def self.down
    drop_table :stoppages
  end
end
