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
#       can :manage, Communication
#       lawfirm_admin if user.role? :lawfirm_admin
#       matter  if user.has_access?(:Matters)
#       account  if user.has_access?(:Accounts)
#       contact  if user.has_access?(:Contacts)
#       opportunity  if user.has_access?(:Opportunity)
#       campaign  if user.has_access?(:Campaigns)
#       time_expense  if user.has_access?('Time & Expense')
#       mail if user.has_access?(:Mail)
#       report if user.has_access?(:Reports)
#       my_favorite if user.has_access?(:Reports)
#       workspace if user.has_access?(:Workspace)
#       document_repository if user.has_access?('Document Repository')
    end    
    
  end
  
  def lawfirm_admin
    can :manage, :all
    cannot :create, ServiceProvider
    cannot :update, ServiceProvider
    cannot :destroy, ServiceProvider
    
    cannot :index, Company
    cannot :create, Company
    cannot :update, Company
    cannot :destroy, Company
    
    cannot :manage, Product
    cannot :manage, Subproduct
    cannot :manage, ServiceProvider
    cannot :manage, ProductLicence    
    
  end
  
  def matter
    can :manage, Matter
  end    
end
