class CreateCentricsteels < ActiveRecord::Migration
  def self.up
    create_table :centricsteels do |t|
      t.string :name
      t.text :address
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :excise_registration_no
      t.string :vat_tin
      t.string :cst
      t.string :pan_no
      t.string :ecc_no
      t.string :ifc
      t.string :dgft_code
      t.text :range
      t.string :division
      t.string :collectorate

      t.timestamps
    end
  end

  def self.down
    drop_table :centricsteels
  end
end
