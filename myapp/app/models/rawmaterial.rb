class Rawmaterial < ActiveRecord::Base
  belongs_to :rawmaterial_category
  has_many :slittings
  has_many :slittingproductions

  # Here rowmaterial status 
  # 0 = still in stock and not used till now
  # 1 = not in stock and going for process
  
  validates_presence_of :name
  validates_presence_of :width
  validates_presence_of :thickness
  validates_presence_of :coil_weight
  validates_presence_of :rawmaterial_category_id
  
end
