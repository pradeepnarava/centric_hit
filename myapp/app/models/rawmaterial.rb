class Rawmaterial < ActiveRecord::Base
  belongs_to:rawmaterial_category
  has_many:slittings
  has_many:slittingproductions
  
end
