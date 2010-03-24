class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :phone
      t.string :mobile
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :user_id
      t.integer :department_id
      t.integer :mgr_id
      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
