class Supplier < ActiveRecord::Base
  has_many:rawmaterials
  validates_presence_of :name
end
