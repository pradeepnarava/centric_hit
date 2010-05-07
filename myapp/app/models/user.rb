class User < ActiveRecord::Base
  has_one  :employee, :dependent => :destroy
  has_one  :assignment
  has_one  :role, :through => :assignment
  acts_as_authentic
  validates_presence_of:login
  validates_uniqueness_of :login
  validates_presence_of:email
  validates_length_of :password, :within => 5..40
#  validates_confirmation_of :password
  validates_format_of :email,
    :with => /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/,
    :message => "Please specify a valid email address.",
    :if => :email?
  validates_presence_of:login
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
