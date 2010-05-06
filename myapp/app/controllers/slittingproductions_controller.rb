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
    @coils = Slitting.all.collect { |sl| sl.rawmaterial}.uniq
    @employees = Employee.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slittingproduction }
    end
  end

  def coil_detail
    @coil = Rawmaterial.find(params[:id])
    @slittings = @coil.slittings.find(:all, :conditions => ["status = 0"])
    
    unless @slittings.blank?
      @slittings.each do |sl|
        @slitt_rawmaterial_id = sl.slitt_rawmaterial_id
        @no_of_slits = @no_of_slits.to_i + sl.no_of_slits 
      end  
      slitcoil = Rawmaterial.find(@slitt_rawmaterial_id).name
      if slitcoil.include? "PT1"
        @slitting_coilno = @coil.name+"-A"
      elsif slitcoil.include? "PT2"
        @slitting_coilno = @coil.name+"-B"
      elsif slitcoil.include? "PT3"
        @slitting_coilno = @coil.name+"-C"
      elsif slitcoil.include? "PT4"
        @slitting_coilno = @coil.name+"-D"
      elsif slitcoil.include? "PT5"
        @slitting_coilno = @coil.name+"-E"
      elsif slitcoil.include? "PT6"
        @slitting_coilno = @coil.name+"-F"        
      end
    end
    
  end  

  # GET /slittingproductions/1/edit
  def edit
    @slittingproduction = Slittingproduction.find(params[:id])
    @coils = Slitting.all.collect { |sl| sl.rawmaterial}.uniq
    @employees = Employee.all
  end

  # POST /slittingproductions
  # POST /slittingproductions.xml
  def create
    data = params
    @error = 0
    @coil = Rawmaterial.find(data[:slittingproduction][:rawmaterial_id])
    @coil.slittings.each do |slit|
      @slitting = data["#{slit.id}"].rehash.each_pair do |key,value|
        unless value[:slitting_coil_no].blank?
          @slittingproduction = Slittingproduction.new(data[:slittingproduction])
          @slittingproduction.slitting_coil_no = value[:slitting_coil_no]
          @slittingproduction.slitting_id = slit.id
          @slittingproduction.input_weight = slit.process_coil_wt
          @slittingproduction.width = @coil.width
          @slittingproduction.thickness = @coil.thickness
          @slittingproduction.grade = @coil.grade
          @slittingproduction.width_slitting = slit.slit_width
          @slittingproduction.slit_coil_weight = slit.slit_weight
          @slittingproduction.status = 1
          if @slittingproduction.save
            flash[:notice] = 'Slitting Production was successfully created.'
          else
            @error = 1
          end     
        end
      end      
      slittingproduction = Slittingproduction.find_all_by_slitting_id(slit.id)
      if slit.update_attributes!(:produced_no_of_slit => slittingproduction.size.to_i)
        if slit.no_of_slits.to_i == slit.produced_no_of_slit.to_i
          slit.update_attributes(:status => 1)
        end
      end
    end
    if @error == 0
      redirect_to slittingproductions_path
    else
      render :action => "new"
    end     

  end

  # PUT /slittingproductions/1
  # PUT /slittingproductions/1.xml
  def update
    @slittingproduction = Slittingproduction.find(params[:id])

    respond_to do |format|
      if @slittingproduction.update_attributes(params[:slittingproduction])
        flash[:notice] = 'Slittingproduction was successfully updated.'
        format.html { redirect_to slittingproductions_path }
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
