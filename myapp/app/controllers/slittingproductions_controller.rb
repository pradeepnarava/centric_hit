class SlittingproductionsController < ApplicationController
  # GET /slittingproductions
  # GET /slittingproductions.xml


  def index
    @slittingproductions = Slittingproduction.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slittingproductions }
    end
  end

  # GET /slittingproductions/1
  # GET /slittingproductions/1.xml
  def show
    @slittingproduction = Slittingproduction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slittingproduction }
    end
  end

  # GET /slittingproductions/new
  # GET /slittingproductions/new.xml
  def new
    @slittingproduction = Slittingproduction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slittingproduction }
    end
  end

  # GET /slittingproductions/1/edit
  def edit
    @slittingproduction = Slittingproduction.find(params[:id])
  end

  # POST /slittingproductions
  # POST /slittingproductions.xml
  def create
    @slittingproduction = Slittingproduction.new(params[:slittingproduction])

    respond_to do |format|
      if @slittingproduction.save
        flash[:notice] = 'Slittingproduction was successfully created.'
        format.html { redirect_to(@slittingproduction) }
        format.xml  { render :xml => @slittingproduction, :status => :created, :location => @slittingproduction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slittingproduction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slittingproductions/1
  # PUT /slittingproductions/1.xml
  def update
    @slittingproduction = Slittingproduction.find(params[:id])

    respond_to do |format|
      if @slittingproduction.update_attributes(params[:slittingproduction])
        flash[:notice] = 'Slittingproduction was successfully updated.'
        format.html { redirect_to(@slittingproduction) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slittingproduction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slittingproductions/1
  # DELETE /slittingproductions/1.xml
  def destroy
    @slittingproduction = Slittingproduction.find(params[:id])
    @slittingproduction.destroy

    respond_to do |format|
      format.html { redirect_to(slittingproductions_url) }
      format.xml  { head :ok }
    end
  end
end
