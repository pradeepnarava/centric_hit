class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :company_name
      t.string :address_one
      t.string :address_two
      t.string :phone_no
      t.string :fax_no
      t.string :email
      t.string :contact_person
      t.string :excise_reg_no
      t.string :range
      t.string :division
      t.string :collectorate
      t.string :ecc_no
      t.string :vat_tin_no
      t.string :cst_tin_no
      t.string :ifc_no
      t.string :dgft_no
      t.string :pan_no
      t.string :service_tax_reg
      t.string :gta_red_no
      t.string :bankers
      t.string :bank_a_c_no

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
