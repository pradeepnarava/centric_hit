class StoppagesController < ApplicationController
  # GET /stoppages
  # GET /stoppages.xml
  def index
    @stoppages = Stoppage.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stoppages }
    end
  end

  # GET /stoppages/1
  # GET /stoppages/1.xml
  def show
    @stoppage = Stoppage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stoppage }
    end
  end

  # GET /stoppages/new
  # GET /stoppages/new.xml
  def new
    @stoppage = Stoppage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stoppage }
    end
  end

  # GET /stoppages/1/edit
  def edit
    @stoppage = Stoppage.find(params[:id])
  end

  # POST /stoppages
  # POST /stoppages.xml
  def create
    @stoppage = Stoppage.new(params[:stoppage])

    respond_to do |format|
      if @stoppage.save
        flash[:notice] = 'Stoppage was successfully created.'
        format.html { redirect_to(stoppages_path) }
        format.xml  { render :xml => @stoppage, :status => :created, :location => @stoppage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stoppage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stoppages/1
  # PUT /stoppages/1.xml
  def update
    @stoppage = Stoppage.find(params[:id])

    respond_to do |format|
      if @stoppage.update_attributes(params[:stoppage])
        flash[:notice] = 'Stoppage was successfully updated.'
        format.html { redirect_to(@stoppage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stoppage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stoppages/1
  # DELETE /stoppages/1.xml
  def destroy
    @stoppage = Stoppage.find(params[:id])
    @stoppage.destroy

    respond_to do |format|
      format.html { redirect_to(stoppages_url) }
      format.xml  { head :ok }
    end
  end
end
