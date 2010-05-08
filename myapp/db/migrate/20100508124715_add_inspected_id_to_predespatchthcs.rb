class AddInspectedIdToPredespatchthcs < ActiveRecord::Migration
  def self.up
     add_column:predespatchtcs,:inspected_id,:integer
  end

  def self.down
     remove_column:predespatchtcs,:inspected_id
  end
end
