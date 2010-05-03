class TubeMillPerformanceReport < ActiveRecord::Base
  belongs_to :slittingproduction
  belongs_to :customer
  has_many :predespatchtcs
  
  def rejected
    self.open + self.joint + self.tool_mark + self.roll_mark + self.pick_up + self.scratch + self.weak_weld + self.bend + self.nf_c 
  end
  
  def prime
    self.no_of_tube
  end
  
  def yieldpercent
    total = prime + rejected
    a = (prime / total).to_f
    return sprintf("%.3f",a)
  end
  
  def openpercent
    total = prime + rejected
    a = (self.open / total).to_f    
    return sprintf("%.3f",a)
  end
  
  def commercialpercent
    total = prime + rejected
    a = ( (rejected - self.open) / total).to_f 
    return sprintf("%.3f",a)
  end
  
end
