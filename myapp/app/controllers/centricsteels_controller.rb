class CentricsteelsController < ApplicationController
  # GET /centricsteels
  # GET /centricsteels.xml
  def index
    @centricsteels = Centricsteel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @centricsteels }
    end
  end

  # GET /centricsteels/1
  # GET /centricsteels/1.xml
  def show
    @centricsteel = Centricsteel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @centricsteel }
    end
  end

  # GET /centricsteels/new
  # GET /centricsteels/new.xml
  def new
    @centricsteel = Centricsteel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @centricsteel }
    end
  end

  # GET /centricsteels/1/edit
  def edit
    @centricsteel = Centricsteel.find(params[:id])
  end

  # POST /centricsteels
  # POST /centricsteels.xml
  def create
    @centricsteel = Centricsteel.new(params[:centricsteel])

    respond_to do |format|
      if @centricsteel.save
        flash[:notice] = 'Centricsteel was successfully created.'
        format.html { redirect_to(@centricsteel) }
        format.xml  { render :xml => @centricsteel, :status => :created, :location => @centricsteel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @centricsteel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /centricsteels/1
  # PUT /centricsteels/1.xml
  def update
    @centricsteel = Centricsteel.find(params[:id])

    respond_to do |format|
      if @centricsteel.update_attributes(params[:centricsteel])
        flash[:notice] = 'Centricsteel was successfully updated.'
        format.html { redirect_to(@centricsteel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @centricsteel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /centricsteels/1
  # DELETE /centricsteels/1.xml
  def destroy
    @centricsteel = Centricsteel.find(params[:id])
    @centricsteel.destroy

    respond_to do |format|
      format.html { redirect_to(centricsteels_url) }
      format.xml  { head :ok }
    end
  end
end
