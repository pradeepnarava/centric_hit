class Stoppage < ActiveRecord::Base
  has_many:tube_mill_stoppage_reports
end
