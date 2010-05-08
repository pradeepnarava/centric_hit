class Predespatchtc < ActiveRecord::Base
  belongs_to:customer
  belongs_to:slittingproduction
  belongs_to:tube_mill_performance_report
  #belongs_to:taxinvoice
  belongs_to:specification
end
