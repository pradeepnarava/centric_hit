class SalesplansController < ApplicationController
  # GET /salesplans
  # GET /salesplans.xml
  def index
    @salesplans = Salesplan.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @salesplans }
    end
  end

  # GET /salesplans/1
  # GET /salesplans/1.xml
  def show
    @salesplan = Salesplan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @salesplan }
    end
  end

  # GET /salesplans/new
  # GET /salesplans/new.xml
  def new
    @salesplan = Salesplan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @salesplan }
    end
  end

  # GET /salesplans/1/edit
  def edit
    @salesplan = Salesplan.find(params[:id])
  end

  # POST /salesplans
  # POST /salesplans.xml
  def create
    @salesplan = Salesplan.new(params[:salesplan])
    respond_to do |format|
      if @salesplan.save
        flash[:notice] = 'Salesplan was successfully created.'
        format.html { redirect_to(@salesplan) }
        format.xml  { render :xml => @salesplan, :status => :created, :location => @salesplan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @salesplan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /salesplans/1
  # PUT /salesplans/1.xml
  def update
    @salesplan = Salesplan.find(params[:id])

    respond_to do |format|
      if @salesplan.update_attributes(params[:salesplan])
        flash[:notice] = 'Salesplan was successfully updated.'
        format.html { redirect_to(@salesplan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @salesplan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /salesplans/1
  # DELETE /salesplans/1.xml
  def destroy
    @salesplan = Salesplan.find(params[:id])
    @salesplan.destroy

    respond_to do |format|
      format.html { redirect_to(salesplans_url) }
      format.xml  { head :ok }
    end
  end
end
