class TubeMillPerformanceReport < ActiveRecord::Base
  belongs_to :slittingproduction
  belongs_to :customer
  has_many :predespatchtcs
  
  def rejected
    self.open + self.joint + self.tool_mark + self.roll_mark + self.pick_up + self.scratch + self.weak_weld + self.bend + self.nf_c 
  end
  
  def prime
    self.lot_no
  end
  
  def yieldpercent
    total = prime + rejected
    return (prime / total).to_f
  end
end
