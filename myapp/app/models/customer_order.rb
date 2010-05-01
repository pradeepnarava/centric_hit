class CustomerOrder < ActiveRecord::Base
  belongs_to :customer
  belongs_to :serialize
  has_many:deliverychallans
  
  validates_presence_of :tube_size
end
