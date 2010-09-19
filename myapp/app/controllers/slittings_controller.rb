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
    @coils = Rawmaterial.find(:all, :conditions => ["status = 0 and mother_id is null"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slitting }
    end
  end

  # GET /slittings/1/edit
  def edit
    @slitting = Slitting.find(params[:id])
    @coils = Rawmaterial.find(:all, :conditions => ["status < 2"])
    @slitting_all = Slitting.find(:all,:conditions=>["rawmaterial_id=?",@slitting.rawmaterial_id])
  end

  # POST /slittings
  # POST /slittings.xml
  def create
    data = params   
    dprt = data[:slitting][:division_part]
    @error = 0
    @coil = Rawmaterial.find(data[:slitting][:rawmaterial_id])
    if dprt.to_i > 1
        for dpt in 1..dprt.to_i
          name = "#{@coil.name}" + "-PT#{dpt}"
          rawm = Rawmaterial.create(:name => name, :width => @coil.width ,:thickness => @coil.thickness, :coil_weight => data[:slitting][:process_coil_wt], :rawmaterial_category_id => @coil.rawmaterial_category_id, :grade => @coil.grade, :dateofreciept => @coil.dateofreciept, :address_id => @coil.address_id, :mother_id => @coil.id)
        end
    end
    slitted_coil = Rawmaterial.find(:first, :conditions=> ["status = 0 and mother_id = ?",@coil.id])
    @slit_plan = data.rehash.each_pair do |key,value|
      unless value[:slitting].blank?
        @slitting = Slitting.new(value[:slitting])
        if @slitting.valid?
          @slitting.rawmaterial_id = data[:slitting][:rawmaterial_id]
          @slitting.scrap = data[:slitting][:scrap]
          @slitting.division_part = data[:slitting][:division_part]
          @slitting.process_coil_wt = data[:slitting][:process_coil_wt]
          @slitting.slitt_rawmaterial_id = slitted_coil.id unless slitted_coil.blank?
          if @slitting.save
            flash[:notice] = 'Slitting Plan was successfully created.'
          else
            @error = 1
          end         
        end       
      end
    end
    if @error == 0
      if dprt.to_i <= 1
        @coil.update_attributes(:status => 1)
      end
      slitted_coil.update_attributes(:status => 1) unless slitted_coil.blank?
      redirect_to(slittings_path)
    else
      render :action => "new"
    end   
  end

  def coil_detail
    #@coil = Rawmaterial.find(params[:id])
    childcoil = Rawmaterial.find(:first,:conditions => ["status = 0 and mother_id = ?",params[:id]])
    if childcoil.blank?
      @coil = Rawmaterial.find(params[:id])
    else
      @coil = Rawmaterial.find(childcoil.id)
    end
  end
  
  # PUT /slittings/1
  # PUT /slittings/1.xml
  def update
    @slitting = Slitting.find(params[:id])

    respond_to do |format|
      if @slitting.update_attributes(params[:slitting])
        flash[:notice] = 'Slitting was successfully updated.'
        format.html { redirect_to slittings_path }
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
