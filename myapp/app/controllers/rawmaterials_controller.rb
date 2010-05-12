class RawmaterialsController < ApplicationController
  before_filter :require_user
  # GET /rawmaterials
  # GET /rawmaterials.xml
  def index
    @rawmaterials = Rawmaterial.find(:all, :order => :status)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rawmaterials }
    end
  end

  # GET /rawmaterials/1
  # GET /rawmaterials/1.xml
  def show
    @rawmaterial = Rawmaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rawmaterial }
    end
  end

  # GET /rawmaterials/new
  # GET /rawmaterials/new.xml
  def new
    @rawmaterial = Rawmaterial.new
    @rawmaterialcategory = RawmaterialCategory.all
    @addresses=Address.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rawmaterial }
    end
  end

  # GET /rawmaterials/1/edit
  def edit
    @rawmaterial = Rawmaterial.find(params[:id])
    @rawmaterialcategory = RawmaterialCategory.all
    @addresses=Address.all
  end

  # POST /rawmaterials
  # POST /rawmaterials.xml
  def create
    data = params[:rawmaterial]
    @rawmaterial = Rawmaterial.new(data)
    @addresses=Address.all
    @rawmaterialcategory = RawmaterialCategory.all
#    unless data[:address_id].blank?
      respond_to do |format|
        if @rawmaterial.save
          flash[:notice] = 'Rawmaterial was successfully created.'
          format.html { redirect_to(:controller=>'suppliers',:action=>'new') }
          format.xml  { render :xml => @rawmaterial, :status => :created, :location => @rawmaterial }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @rawmaterial.errors, :status => :unprocessable_entity }
        end
      end
#    else
#      flash[:error] = 'Please Fill All the mandatory fields.'
#    end
  end

  # PUT /rawmaterials/1
  # PUT /rawmaterials/1.xml
  def update
    @rawmaterial = Rawmaterial.find(params[:id])

    respond_to do |format|
      if @rawmaterial.update_attributes(params[:rawmaterial])
        flash[:notice] = 'Rawmaterial was successfully updated.'
        format.html { redirect_to(@rawmaterial) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rawmaterial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rawmaterials/1
  # DELETE /rawmaterials/1.xml
  def destroy
    @rawmaterial = Rawmaterial.find(params[:id])
    @rawmaterial.destroy

    respond_to do |format|
      format.html { redirect_to(rawmaterials_url) }
      format.xml  { head :ok }
    end
  end

  def wide_coil
    @rawmaterials = Rawmaterial.find(:all, :conditions=>['status = 0 and mother_id is NULL'],:order => :dateofreciept)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rawmaterials }
    end    
  end
  
end
