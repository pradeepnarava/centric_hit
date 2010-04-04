class Serialize < ActiveRecord::Base
  has_many:customer_orders
  belongs_to:customer


  def tube_size
    (self.od.to_f)*(self.length.to_f)*(self.thikness.to_f)
  end
end
