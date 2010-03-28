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

  # POST /taxinvoices
  # POST /taxinvoices.xml
  def create
    @taxinvoice = Taxinvoice.new(params[:taxinvoice])

    respond_to do |format|
      if @taxinvoice.save
        flash[:notice] = 'Taxinvoice was successfully created.'
        format.html { redirect_to(@taxinvoice) }
        format.xml  { render :xml => @taxinvoice, :status => :created, :location => @taxinvoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @taxinvoice.errors, :status => :unprocessable_entity }
      end
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
