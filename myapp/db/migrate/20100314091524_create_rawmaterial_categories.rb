class CreateRawmaterialCategories < ActiveRecord::Migration
  def self.up
    create_table :rawmaterial_categories do |t|
      t.string :name
      t.string :grade

      t.timestamps
    end
  end

  def self.down
    drop_table :rawmaterial_categories
  end
end
