class Address < ActiveRecord::Base
  has_many:rawmaterials
  validates_presence_of :company_name
  validates_presence_of :fax_no
  validates_presence_of :contact_person
  validates_uniqueness_of  :excise_reg_no
  validates_presence_of :range
  validates_presence_of :division
  validates_presence_of :collectorate
  validates_presence_of :city
  validates_presence_of :zipcode
  validates_presence_of :ecc_no
  validates_uniqueness_of :ecc_no
  validates_uniqueness_of :vat_tin_no
  validates_uniqueness_of :cst_tin_no
  validates_uniqueness_of :ifc_no
  validates_uniqueness_of :pan_no
  validates_presence_of :dgft_no
  validates_presence_of :service_tax_reg
  validates_presence_of :bank_a_c_no
  validates_presence_of :address
  validates_format_of :email,
    :with => /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/,
    :message => "Please specify a valid email address.",
    :if => :email?
end
