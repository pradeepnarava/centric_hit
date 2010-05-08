# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class Ability
  include CanCan::Ability  
  def initialize(user)
    @user = user ||= User.new     
    #Uncomment the following two lines, if cancan is break your code or you want to disable the can-can activity.
    
    #can :manage, :all
    #return true
    
    if user.role? :admin
      can :manage, :all
    else
      manager if user.role?(:manager)
      operator if user.role?(:operator)
    end    
    
  end
  
  def manager
    can :manage, :all
    cannot :manage, Role
    cannot :manage, Department
    cannot :manage, User    
    cannot :manage, Employee
    cannot :manage, Centricsteel
  end
  
  def operator
    can :manage, :all
    cannot :manage, Role
    cannot :manage, Department
    cannot :manage, User    
    cannot :manage, Employee
    cannot :manage, Centricsteel
  end    
end
