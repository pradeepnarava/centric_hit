class User < ActiveRecord::Base
  acts_as_authentic
  
  def roles
    myrole = []
    for myObj in self.assignments
      myrole << myObj.role.name.to_s
    end
    myrole
  end
  
  def role?(role)
    roles.include? role.to_s
  end  
end
