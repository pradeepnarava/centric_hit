class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def new
    @employees = Employee.non_user_employee
    @user = User.new
    @roles = Role.all
  end
  
  def create
    @employees = Employee.non_user_employee
    @user = User.new(params[:user])
    @roles = Role.all
    
    if @user.save
      @employee = Employee.find(params[:employee][:id])
      @employee.update_attributes(:user_id => @user.id)
      @assignment = Assignment.create(:role_id => params[:role][:id],:user_id =>@user.id)
      flash[:notice] = "User Login Created!"
      redirect_back_or_default users_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
 
  def edit
    @user = User.find(params[:id])
    @employees = Employee.non_user_employee
    @roles = Role.all
  end
  
  def update
    @user = User.find(params[:id]) # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      @assignment = @user.assignment.update_attributes(:role_id => params[:role][:id])
      flash[:notice] = "User updated!"
      redirect_to users_url
    else
      render :action => :edit
    end
  end  
end
