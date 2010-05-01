class PredespatchtcsController < ApplicationController
  # GET /predespatchtcs
  # GET /predespatchtcs.xml
  def index
    @predespatchtcs = Predespatchtc.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @predespatchtcs }
    end
  end

  # GET /predespatchtcs/1
  # GET /predespatchtcs/1.xml
  def show
    @predespatchtc = Predespatchtc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @predespatchtc }
    end
  end

  # GET /predespatchtcs/new
  # GET /predespatchtcs/new.xml
  def new
    @predespatchtc = Predespatchtc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @predespatchtc }
    end
  end

  # GET /predespatchtcs/1/edit
  def edit
    @predespatchtc = Predespatchtc.find(params[:id])
  end
def specification_to_predespatch
@specification=Specification.find(params[id])
end
  # POST /predespatchtcs
  # POST /predespatchtcs.xml
  def create
    @predespatchtc = Predespatchtc.new(params[:predespatchtc])

    respond_to do |format|
      if @predespatchtc.save
        flash[:notice] = 'Predespatchtc was successfully created.'
        format.html { redirect_to(@predespatchtc) }
        format.xml  { render :xml => @predespatchtc, :status => :created, :location => @predespatchtc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @predespatchtc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /predespatchtcs/1
  # PUT /predespatchtcs/1.xml
  def update
    @predespatchtc = Predespatchtc.find(params[:id])

    respond_to do |format|
      if @predespatchtc.update_attributes(params[:predespatchtc])
        flash[:notice] = 'Predespatchtc was successfully updated.'
        format.html { redirect_to(@predespatchtc) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @predespatchtc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /predespatchtcs/1
  # DELETE /predespatchtcs/1.xml
  def destroy
    @predespatchtc = Predespatchtc.find(params[:id])
    @predespatchtc.destroy

    respond_to do |format|
      format.html { redirect_to(predespatchtcs_url) }
      format.xml  { head :ok }
    end
  end
end
