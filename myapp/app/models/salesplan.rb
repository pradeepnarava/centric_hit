class Salesplan < ActiveRecord::Base
  belongs_to:customer
    belongs_to:serialize
end
