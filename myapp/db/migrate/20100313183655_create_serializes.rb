class CreateSerializes < ActiveRecord::Migration
  def self.up
    create_table :serializes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :serializes
  end
end
