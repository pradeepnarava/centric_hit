class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :contact_person
      t.integer :phone
      t.integer :mobile
      t.string :email
      t.string :excise_registration_no
      t.string :vat_no
      t.string :tin_no
      t.string :pan_no
      t.string :payment_terms
      t.string :bankers

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
