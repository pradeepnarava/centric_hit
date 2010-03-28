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

  # POST /deliverychallans
  # POST /deliverychallans.xml
  def create
    @deliverychallan = Deliverychallan.new(params[:deliverychallan])

    respond_to do |format|
      if @deliverychallan.save
        flash[:notice] = 'Deliverychallan was successfully created.'
        format.html { redirect_to(@deliverychallan) }
        format.xml  { render :xml => @deliverychallan, :status => :created, :location => @deliverychallan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deliverychallan.errors, :status => :unprocessable_entity }
      end
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
