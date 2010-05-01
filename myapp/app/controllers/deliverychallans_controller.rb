class DeliverychallansController < ApplicationController
  # GET /deliverychallans
  # GET /deliverychallans.xml
  def index
    @deliverychallans = Deliverychallan.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deliverychallans }
    end
  end

  # GET /deliverychallans/1
  # GET /deliverychallans/1.xml
  def show
    @deliverychallan = Deliverychallan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deliverychallan }
    end
  end

  # GET /deliverychallans/new
  # GET /deliverychallans/new.xml
  def new
    @deliverychallan = Deliverychallan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deliverychallan }
    end
  end

  # GET /deliverychallans/1/edit
  def edit
    @deliverychallan = Deliverychallan.find(params[:id])
  end

  def serial_detail_delivery
    @customer_order=CustomerOrder.find(params[:id])
  end

  def customer_po
    @customer_po=CustomerOrder.find_all_by_customer_id(params[:id])
    end

  def create
    data=params 
    @error = 0
    @save_order = data.rehash.each_pair do |key,value|  
      @deliverychallan =Deliverychallan.new(value[:deliverychallan])
      if  @deliverychallan.valid?
        @deliverychallan.customer_id = data[:deliverychallan][:customer_id]
        @deliverychallan.delivery_challan_no = data[:deliverychallan][:delivery_challan_no]
        @deliverychallan.vehicle_no = data[:deliverychallan][:vehicle_no]
        @deliverychallan.remark = data[:deliverychallan][:remark]
        @deliverychallan.from = data[:deliverychallan][:from]
        @deliverychallan.date = data[:deliverychallan][:date]
        if  @deliverychallan.save
          @customer_order=CustomerOrder.find_all_by_id(@deliverychallan.customer_order_id)
          for customer in @customer_order
            @balance=  (customer.balance)-(@deliverychallan.quantity_pcs)
            if @balance==0
              customer.update_attributes(:balance=>@balance,:status=>3)
            else
              customer.update_attributes(:balance=>@balance,:status=>2)
            end
          end
          flash[:notice] = 'Delivery Challan was successfully created.'
        else
          @error = 1
        end
      end
    end
    if @error == 0
      redirect_to(deliverychallans_url)
    else
      render :action => "new"
    end
  end



  # PUT /deliverychallans/1
  # PUT /deliverychallans/1.xml
  def update
    @deliverychallan = Deliverychallan.find(params[:id])

    respond_to do |format|
      if @deliverychallan.update_attributes(params[:deliverychallan])
        flash[:notice] = 'Deliverychallan was successfully updated.'
        format.html { redirect_to(@deliverychallan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deliverychallan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deliverychallans/1
  # DELETE /deliverychallans/1.xml
  def destroy
    @deliverychallan = Deliverychallan.find(params[:id])
    @deliverychallan.destroy

    respond_to do |format|
      format.html { redirect_to(deliverychallans_url) }
      format.xml  { head :ok }
    end
  end
end
