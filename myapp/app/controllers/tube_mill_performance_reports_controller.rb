class TubeMillPerformanceReportsController < ApplicationController
  # GET /tube_mill_performance_reports
  # GET /tube_mill_performance_reports.xml
  def index
    @tube_mill_performance_reports = TubeMillPerformanceReport.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tube_mill_performance_reports }
    end
  end

  # GET /tube_mill_performance_reports/1
  # GET /tube_mill_performance_reports/1.xml
  def show
    @tube_mill_performance_report = TubeMillPerformanceReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tube_mill_performance_report }
    end
  end

  # GET /tube_mill_performance_reports/new
  # GET /tube_mill_performance_reports/new.xml
  def new
    @tube_mill_performance_report = TubeMillPerformanceReport.new
    @customers = Customer.all
    @slittingproductions = Slittingproduction.find(:all,:conditions => ["status = 1"])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tube_mill_performance_report }
    end
  end

  # GET /tube_mill_performance_reports/1/edit
  def edit
    @tube_mill_performance_report = TubeMillPerformanceReport.find(params[:id])
    @customers = Customer.all
    @slittingproductions = Slittingproduction.all
  end

  # POST /tube_mill_performance_reports
  # POST /tube_mill_performance_reports.xml
  def create
    @tube_mill_performance_report = TubeMillPerformanceReport.new(params[:tube_mill_performance_report])
        @tube_mill_performance_report.status=1
    respond_to do |format|
      if @tube_mill_performance_report.save

        @slitting_status=Slittingproduction.find(params[:tube_mill_performance_report][:slittingproduction_id])
        @slitting_status.update_attribute('status',2)
        
        @rawmaterail_status=Rawmaterial.find(@slitting_status.rawmaterial_id)
        @rawmaterail_status.update_attribute('status',2)
        flash[:notice] = 'TubeMillPerformanceReport was successfully created.'
        format.html { redirect_to(tube_mill_performance_reports_path) }
        format.xml  { render :xml => @tube_mill_performance_report, :status => :created, :location => @tube_mill_performance_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tube_mill_performance_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tube_mill_performance_reports/1
  # PUT /tube_mill_performance_reports/1.xml
  def update
    @tube_mill_performance_report = TubeMillPerformanceReport.find(params[:id])

    respond_to do |format|
      if @tube_mill_performance_report.update_attributes(params[:tube_mill_performance_report])
        flash[:notice] = 'TubeMillPerformanceReport was successfully updated.'
        format.html { redirect_to(tube_mill_performance_reports_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tube_mill_performance_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tube_mill_performance_reports/1
  # DELETE /tube_mill_performance_reports/1.xml
  def destroy
    @tube_mill_performance_report = TubeMillPerformanceReport.find(params[:id])
    @tube_mill_performance_report.destroy

    respond_to do |format|
      format.html { redirect_to(tube_mill_performance_reports_url) }
      format.xml  { head :ok }
    end
  end
  
  def production_index
    @tube_mill_performance_reports = TubeMillPerformanceReport.all
    # TODO
    # need to find yield %
    # prime qty(wt) = 500
    # rejection qty (wt) = 8
    # yeild = prime qty /  total qty
    # i.e. 500 / 508
  end
  
  def production_detail
    @tube_mill = TubeMillPerformanceReport.find(params[:id])
  end
  
end
