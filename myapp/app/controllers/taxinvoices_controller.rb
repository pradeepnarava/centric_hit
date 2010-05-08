class TaxinvoicesController < ApplicationController
  # GET /taxinvoices
  # GET /taxinvoices.xml
  def index
    @taxinvoices = Taxinvoice.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @taxinvoices }
    end
  end

  # GET /taxinvoices/1
  # GET /taxinvoices/1.xml
  def show
    @taxinvoice = Taxinvoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @taxinvoice }
    end
  end

  # GET /taxinvoices/new
  # GET /taxinvoices/new.xml
  def new
    @taxinvoice = Taxinvoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @taxinvoice }
    end
  end

  # GET /taxinvoices/1/edit
  def edit
    @taxinvoice = Taxinvoice.find(params[:id])
  end

  
  def deliverydetail
    @delivery_challan=Deliverychallan.find_all_by_customer_id(params[:id])
  end

  def deliverychallan_detail
    @deliverychallan_detail=Deliverychallan.find(params[:id])
  end

  # POST /taxinvoices
  # POST /taxinvoices.xml
  def create
    data=params
    @error = 0
    @save_order = data.rehash.each_pair do |key,value|
      @taxinvoice =Taxinvoice.new(value[:taxinvoice])
          if  @taxinvoice.valid?
        @taxinvoice.customer_id = data[:taxinvoice][:customer_id]
        @taxinvoice.date_of_preparation_invoice =data[:taxinvoice][:date_of_preparation_invoice]
        @taxinvoice.date_invoice_no = data[:taxinvoice][:date_invoice_no]
        @taxinvoice.timeof_invoice = data[:taxinvoice][:timeof_invoice]
         @taxinvoice.date_challan_no = data[:taxinvoice][:date_challan_no]
        @taxinvoice.date_po = data[:taxinvoice][:date_po]
        @taxinvoice.invoice_no = data[:taxinvoice][:invoice_no]
        @taxinvoice.po_no = data[:taxinvoice][:po_no]
        @taxinvoice.in_words = data[:taxinvoice][:in_words]
        @taxinvoice.name_and_adress_of_buyor = data[:taxinvoice][:name_and_adress_of_buyor]
        @taxinvoice.name_and_adress_of_consignee = data[:taxinvoice][:name_and_adress_of_consignee]
        @taxinvoice.lr_no = data[:taxinvoice][:lr_no]
        @taxinvoice.amount = data[:taxinvoice][:amount]
        @taxinvoice.packing_forwarding = data[:taxinvoice][:packing_forwarding]
        @taxinvoice.excise_duty = data[:taxinvoice][:excise_duty]
        @taxinvoice.ed_cess = data[:taxinvoice][:ed_cess]
        @taxinvoice.sah_ed_cess = data[:taxinvoice][:sah_ed_cess]
        @taxinvoice.total_all = data[:taxinvoice][:total_all]
        @taxinvoice.vat_cst = data[:taxinvoice][:vat_cst]
        @taxinvoice.grand_total = data[:taxinvoice][:grand_total]
        if  @taxinvoice.save
          flash[:notice] = 'TaxInvoices was successfully created.'
        else
          @error = 1
        end
      end
    end
    if @error == 0
      redirect_to(taxinvoices_url)
    else
      render :action => "new"
    end
  end

  # PUT /taxinvoices/1
  # PUT /taxinvoices/1.xml
  def update
    @taxinvoice = Taxinvoice.find(params[:id])

    respond_to do |format|
      if @taxinvoice.update_attributes(params[:taxinvoice])
        flash[:notice] = 'Taxinvoice was successfully updated.'
        format.html { redirect_to(@taxinvoice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @taxinvoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /taxinvoices/1
  # DELETE /taxinvoices/1.xml
  def destroy
    @taxinvoice = Taxinvoice.find(params[:id])
    @taxinvoice.destroy

    respond_to do |format|
      format.html { redirect_to(taxinvoices_url) }
      format.xml  { head :ok }
    end
  end
end
