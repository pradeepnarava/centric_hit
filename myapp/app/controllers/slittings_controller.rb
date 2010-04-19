class SlittingsController < ApplicationController
  # GET /slittings
  # GET /slittings.xml
 
  def index
    @slittings = Slitting.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slittings }
    end
  end

  # GET /slittings/1
  # GET /slittings/1.xml
  def show
    @slitting = Slitting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slitting }
    end
  end

  # GET /slittings/new
  # GET /slittings/new.xml
  def new
    @slitting = Slitting.new
    @coils = Rawmaterial.find(:all, :conditions => ["status = 0"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slitting }
    end
  end

  # GET /slittings/1/edit
  def edit
    @slitting = Slitting.find(params[:id])
    @coils = Rawmaterial.find(:all, :conditions => ["status = 0"])
  end

  # POST /slittings
  # POST /slittings.xml
  def create
    data = params    
    @error = 0
    @slit_plan = data.rehash.each_pair do |key,value|
      unless value[:slitting].blank?
        @slitting = Slitting.new(value[:slitting])
        if @slitting.valid?
          @slitting.rawmaterial_id = data[:slitting][:rawmaterial_id]
          @slitting.scrap = data[:slitting][:scrap]
          @slitting.division_part = data[:slitting][:division_part]
          @slitting.process_coil_wt = data[:slitting][:process_coil_wt]
          if @slitting.save
            flash[:notice] = 'Slitting Plan was successfully created.'
          else
            @error = 1
          end          
        end        
      end
    end
    if @error == 0
      @coil = Rawmaterial.find(data[:slitting][:rawmaterial_id])
      @coil.update_attributes(:status => 1)
      redirect_to(@slitting)
    else
      render :action => "new"
    end    
#    respond_to do |format|
#      if @slitting.save
#        flash[:notice] = 'Slitting was successfully created.'
#        format.html { redirect_to(@slitting) }
#        format.xml  { render :xml => @slitting, :status => :created, :location => @slitting }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @slitting.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  def coil_detail
    @coil = Rawmaterial.find(params[:id])    
  end
  
  # PUT /slittings/1
  # PUT /slittings/1.xml
  def update
    @slitting = Slitting.find(params[:id])

    respond_to do |format|
      if @slitting.update_attributes(params[:slitting])
        flash[:notice] = 'Slitting was successfully updated.'
        format.html { redirect_to(@slitting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slitting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slittings/1
  # DELETE /slittings/1.xml
  def destroy
    @slitting = Slitting.find(params[:id])
    @slitting.destroy

    respond_to do |format|
      format.html { redirect_to(slittings_url) }
      format.xml  { head :ok }
    end
  end
end
