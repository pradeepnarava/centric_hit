class Slittingproduction < ActiveRecord::Base
  belongs_to:rawmaterial
  belongs_to:slitting
  has_many:tube_mill_performance_reports
  has_many:uncoiler_reports
  has_many:predespatchtcs
end
