class RawmaterialCategory < ActiveRecord::Base
  has_many :rawmaterials
  validates_presence_of :name,:message=>"Raw Material Categories can't be blank."
end
