class TubeMillPerformanceReport < ActiveRecord::Base
  belongs_to:slittingproduction
  belongs_to:customer
  has_many:predespatchtcs
end
