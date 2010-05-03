class UncoilerReportsController < ApplicationController
  # GET /uncoiler_reports
  # GET /uncoiler_reports.xml
  def index
    @uncoiler_reports = UncoilerReport.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uncoiler_reports }
    end
  end

  # GET /uncoiler_reports/1
  # GET /uncoiler_reports/1.xml
  def show
    @uncoiler_report = UncoilerReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @uncoiler_report }
    end
  end

  # GET /uncoiler_reports/new
  # GET /uncoiler_reports/new.xml
  def new
    @uncoiler_report = UncoilerReport.new
    @employees = Employee.all
    @coils = Slittingproduction.all.collect { |sl| sl.rawmaterial}.uniq
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uncoiler_report }
    end
  end
  
  def coil_detail
    @coil = Rawmaterial.find(params[:id])
    @slittingproductions = @coil.slittingproductions.find(:all, :conditions => ["status = 1"])
  end    

  # GET /uncoiler_reports/1/edit
  def edit
    @uncoiler_report = UncoilerReport.find(params[:id])
    @coils = Slittingproduction.all.collect { |sl| sl.rawmaterial}.uniq
  end

  # POST /uncoiler_reports
  # POST /uncoiler_reports.xml
  def create
    data = params
    @error = 0
    @uncoiler = data.rehash.each_pair do |key,value|

      unless value[:checkuncoiler].blank?         
        @uncoiler_report = UncoilerReport.new(value[:uncoiler])
        @uncoiler_report.date = data[:uncoiler_report][:date]
        @uncoiler_report.operator_name = data[:uncoiler_report][:operator_id]
        @uncoiler_report.shift = data[:uncoiler_report][:shift]
        if @uncoiler_report.save
          @slittingp = Slittingproduction.find(value[:uncoiler][:slittingproduction_id])
          @slittingp.update_attributes(:status => 2)
          flash[:notice] = 'Uncoiler Report was successfully created.'
        else
          @error = 1
        end                 
      end
    end

    if @error == 0
      redirect_to uncoiler_reports_path
    else
      render :action => "new"
    end   

  end

  # PUT /uncoiler_reports/1
  # PUT /uncoiler_reports/1.xml
  def update
    @uncoiler_report = UncoilerReport.find(params[:id])

    respond_to do |format|
      if @uncoiler_report.update_attributes(params[:uncoiler_report])
        flash[:notice] = 'UncoilerReport was successfully updated.'
        format.html { redirect_to uncoiler_reports_path }
        format.xml  {}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uncoiler_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uncoiler_reports/1
  # DELETE /uncoiler_reports/1.xml
  def destroy
    @uncoiler_report = UncoilerReport.find(params[:id])
    @uncoiler_report.destroy

    respond_to do |format|
      format.html { redirect_to(uncoiler_reports_url) }
      format.xml  { head :ok }
    end
  end
end
