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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uncoiler_report }
    end
  end

  # GET /uncoiler_reports/1/edit
  def edit
    @uncoiler_report = UncoilerReport.find(params[:id])
  end

  # POST /uncoiler_reports
  # POST /uncoiler_reports.xml
  def create
    @uncoiler_report = UncoilerReport.new(params[:uncoiler_report])

    respond_to do |format|
      if @uncoiler_report.save
        flash[:notice] = 'UncoilerReport was successfully created.'
        format.html { redirect_to(@uncoiler_report) }
        format.xml  { render :xml => @uncoiler_report, :status => :created, :location => @uncoiler_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uncoiler_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uncoiler_reports/1
  # PUT /uncoiler_reports/1.xml
  def update
    @uncoiler_report = UncoilerReport.find(params[:id])

    respond_to do |format|
      if @uncoiler_report.update_attributes(params[:uncoiler_report])
        flash[:notice] = 'UncoilerReport was successfully updated.'
        format.html { redirect_to(@uncoiler_report) }
        format.xml  { head :ok }
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
