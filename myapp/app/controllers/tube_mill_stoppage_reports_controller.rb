class TubeMillStoppageReportsController < ApplicationController
  # GET /tube_mill_stoppage_reports
  # GET /tube_mill_stoppage_reports.xml
  def index
    @tube_mill_stoppage_reports = TubeMillStoppageReport.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tube_mill_stoppage_reports }
    end
  end

  # GET /tube_mill_stoppage_reports/1
  # GET /tube_mill_stoppage_reports/1.xml
  def show
    @tube_mill_stoppage_report = TubeMillStoppageReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tube_mill_stoppage_report }
    end
  end

  # GET /tube_mill_stoppage_reports/new
  # GET /tube_mill_stoppage_reports/new.xml
  def new
    @tube_mill_stoppage_report = TubeMillStoppageReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tube_mill_stoppage_report }
    end
  end

  # GET /tube_mill_stoppage_reports/1/edit
  def edit
    @tube_mill_stoppage_report = TubeMillStoppageReport.find(params[:id])
  end

  # POST /tube_mill_stoppage_reports
  # POST /tube_mill_stoppage_reports.xml
  def create
    @tube_mill_stoppage_report = TubeMillStoppageReport.new(params[:tube_mill_stoppage_report])

    respond_to do |format|
      if @tube_mill_stoppage_report.save
        flash[:notice] = 'TubeMillStoppageReport was successfully created.'
        format.html { redirect_to(@tube_mill_stoppage_report) }
        format.xml  { render :xml => @tube_mill_stoppage_report, :status => :created, :location => @tube_mill_stoppage_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tube_mill_stoppage_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tube_mill_stoppage_reports/1
  # PUT /tube_mill_stoppage_reports/1.xml
  def update
    @tube_mill_stoppage_report = TubeMillStoppageReport.find(params[:id])

    respond_to do |format|
      if @tube_mill_stoppage_report.update_attributes(params[:tube_mill_stoppage_report])
        flash[:notice] = 'TubeMillStoppageReport was successfully updated.'
        format.html { redirect_to(@tube_mill_stoppage_report) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tube_mill_stoppage_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tube_mill_stoppage_reports/1
  # DELETE /tube_mill_stoppage_reports/1.xml
  def destroy
    @tube_mill_stoppage_report = TubeMillStoppageReport.find(params[:id])
    @tube_mill_stoppage_report.destroy

    respond_to do |format|
      format.html { redirect_to(tube_mill_stoppage_reports_url) }
      format.xml  { head :ok }
    end
  end
end
