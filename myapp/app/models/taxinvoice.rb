class Taxinvoice < ActiveRecord::Base
  #has_many:predespatchtcs
  belongs_to:customer
  belongs_to:deliverychallan
end
