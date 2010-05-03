class Employee < ActiveRecord::Base
  belongs_to :department
  belongs_to :user
#  validates_presence_of:first_name
#  validates_presence_of:last_name

  def self.getname(id)
    self.find(id).full_name
  end
  def self.non_user_employee
    self.find(:all, :conditions =>["user_id is null"])
  end  
  
  def full_name
    self.first_name.blank? || self.last_name.blank? ? self.username : "#{self.first_name} #{self.last_name}"
  end
  
end
