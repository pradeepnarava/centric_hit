class Slitting < ActiveRecord::Base
  belongs_to:rawmaterial
  has_many:slittingproductions
end
