class Serialize < ActiveRecord::Base
  #has_one :customer_order_serialize
  #has_one :customer_order,:through=>:customer_order_serializes
  belongs_to :customer
  belongs_to:specification
  #has_many:serializes

  def tube_size
    "self.od""x.to_s""self.length""x.to_s""self.thikness"
  end
end
