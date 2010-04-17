class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.xml
  def index
    @customers = Customer.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.xml
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        flash[:notice] = 'Customer was successfully created.'
        format.html { redirect_to(@customer) }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        flash[:notice] = 'Customer was successfully updated.'
        format.html { redirect_to(@customer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end
  def customer_report
     @cus_name,@delivery_address,@address,@total_amount,@total_weight,@vat_no,@tin_no,@ecc_no="","","",0,0,0,0,0
    @customer_report = Serialize.find(:all,:conditions=>["customer_id=#{params[:id]}"])
    @customer_report.each do |obj|
      @vat_no=obj.customer.vat_no
      @cus_name=obj.customer.name
      @tin_no=obj.customer.tin_no
      @address= obj.customer.address
      obj.customer_orders.each do |obj1|
        @total_amount=obj1.total_amount+@total_amount if obj1.total_amount
        @total_weight=obj1.total_weight+@total_weight if obj1.total_weight
        @ecc_no=obj1.ecc_no if obj1.ecc_no
        @delivery_address= obj1.delivery_address
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end
end
