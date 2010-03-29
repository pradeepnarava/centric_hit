class User < ActiveRecord::Base
  has_one  :employee, :dependent => :destroy
  has_one  :assignment
  has_one  :role, :through => :assignment
  acts_as_authentic
  

  def roles
    @assignment = self.assignment
    myrole = []
    myrole << @assignment.role.name.to_s    
    myrole
  end
  
  def role?(role)
    roles.include? role.to_s
  end
  

end
