class Slitting < ActiveRecord::Base
  belongs_to :rawmaterial
  has_many :slittingproductions
  validates_presence_of :coil_width
  validates_presence_of :coil_wt
  validates_presence_of :slit_width 
  validates_presence_of :slit_weight
  validates_presence_of :no_of_slits
  validates_presence_of :total_weight
  
  #status 
  #   0 => Only slitted (default)
  #   1 => Slit move to production
end
