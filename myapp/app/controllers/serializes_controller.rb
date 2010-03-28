class SerializesController < ApplicationController
  # GET /serializes
  # GET /serializes.xml
  def index
    @serializes = Serialize.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @serializes }
    end
  end

  # GET /serializes/1
  # GET /serializes/1.xml
  def show
    @serialize = Serialize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @serialize }
    end
  end

  # GET /serializes/new
  # GET /serializes/new.xml
  def new
    @serialize = Serialize.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @serialize }
    end
  end

  # GET /serializes/1/edit
  def edit
    @serialize = Serialize.find(params[:id])
  end

  # POST /serializes
  # POST /serializes.xml
  def create
    @serialize = Serialize.new(params[:serialize])

    respond_to do |format|
      if @serialize.save
        flash[:notice] = 'Serialize was successfully created.'
        format.html { redirect_to(@serialize) }
        format.xml  { render :xml => @serialize, :status => :created, :location => @serialize }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @serialize.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /serializes/1
  # PUT /serializes/1.xml
  def update
    @serialize = Serialize.find(params[:id])

    respond_to do |format|
      if @serialize.update_attributes(params[:serialize])
        flash[:notice] = 'Serialize was successfully updated.'
        format.html { redirect_to(@serialize) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @serialize.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /serializes/1
  # DELETE /serializes/1.xml
  def destroy
    @serialize = Serialize.find(params[:id])
    @serialize.destroy

    respond_to do |format|
      format.html { redirect_to(serializes_url) }
      format.xml  { head :ok }
    end
  end
end
