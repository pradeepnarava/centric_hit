class Taxinvoice < ActiveRecord::Base
  has_many:predespatchtcs
  belongs_to:customer
end
