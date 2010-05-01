class CustomerOrdersController < ApplicationController
  # GET /customer_orders
  # GET /customer_orders.xml
  def index
    @customer_orders = CustomerOrder.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customer_orders }
    end
  end

  # GET /customer_orders/1
  # GET /customer_orders/1.xml
  def show
    @customer_order = CustomerOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer_order }
    end
  end

  # GET /customer_orders/new
  # GET /customer_orders/new.xml
  def new
    @customer_order = CustomerOrder.new
    @customers = Customer.all
    @serials = Serialize.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer_order }
    end
  end

  # GET /customer_orders/1/edit
  def edit
    @customer_order = CustomerOrder.find(params[:id])
    @customers = Customer.all
  end

  # POST /customer_orders
  # POST /customer_orders.xml
  def create
    data=params
    @error = 0
    @save_order = data.rehash.each_pair do |key,value|
      @customer_order = CustomerOrder.new(value[:customer_order])
      if @customer_order.valid?
        @customer_order.customer_id = data[:customer_order][:customer_id]
        @customer_order.delivery_address = data[:customer_order][:delivery_address]
        @customer_order.ecc_no = data[:customer_order][:ecc_no]
         @customer_order.vat_no = data[:customer_order][:vat_no]
        @customer_order.po_no = data[:customer_order][:po_no]
        if @customer_order.save
          flash[:notice] = 'CustomerOrder was successfully created.'
        else
          @error = 1
        end
      end
    end
    if @error == 0
      redirect_to(customer_orders_path)
    else
      render :action => "new"
    end
  end

  def customer_detail
    @customer = Customer.find(params[:id])
    @serials = @customer.serializes
  end

  def serial_detail
    @serial = Serialize.find(params[:id])
  end
  
  
  # PUT /customer_orders/1
  # PUT /customer_orders/1.xml
  def update
    @customer_order = CustomerOrder.find(params[:id])

    respond_to do |format|
      if @customer_order.update_attributes(params[:customer_order])
        flash[:notice] = 'CustomerOrder was successfully updated.'
        format.html { redirect_to(customer_orders_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_orders/1
  # DELETE /customer_orders/1.xml
  def destroy
    @customer_order = CustomerOrder.find(params[:id])
    @customer_order.destroy

    respond_to do |format|
      format.html { redirect_to(customer_orders_url) }
      format.xml  { head :ok }
    end
  end
end
