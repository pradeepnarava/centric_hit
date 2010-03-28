class RawmaterialCategoriesController < ApplicationController
  # GET /rawmaterial_categories
  # GET /rawmaterial_categories.xml
  def index
    @rawmaterial_categories = RawmaterialCategory.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rawmaterial_categories }
    end
  end

  # GET /rawmaterial_categories/1
  # GET /rawmaterial_categories/1.xml
  def show
    @rawmaterial_category = RawmaterialCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rawmaterial_category }
    end
  end

  # GET /rawmaterial_categories/new
  # GET /rawmaterial_categories/new.xml
  def new
    @rawmaterial_category = RawmaterialCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rawmaterial_category }
    end
  end

  # GET /rawmaterial_categories/1/edit
  def edit
    @rawmaterial_category = RawmaterialCategory.find(params[:id])
  end

  # POST /rawmaterial_categories
  # POST /rawmaterial_categories.xml
  def create
    @rawmaterial_category = RawmaterialCategory.new(params[:rawmaterial_category])

    respond_to do |format|
      if @rawmaterial_category.save
        flash[:notice] = 'RawmaterialCategory was successfully created.'
        format.html { redirect_to(@rawmaterial_category) }
        format.xml  { render :xml => @rawmaterial_category, :status => :created, :location => @rawmaterial_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rawmaterial_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rawmaterial_categories/1
  # PUT /rawmaterial_categories/1.xml
  def update
    @rawmaterial_category = RawmaterialCategory.find(params[:id])

    respond_to do |format|
      if @rawmaterial_category.update_attributes(params[:rawmaterial_category])
        flash[:notice] = 'RawmaterialCategory was successfully updated.'
        format.html { redirect_to(@rawmaterial_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rawmaterial_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rawmaterial_categories/1
  # DELETE /rawmaterial_categories/1.xml
  def destroy
    @rawmaterial_category = RawmaterialCategory.find(params[:id])
    @rawmaterial_category.destroy

    respond_to do |format|
      format.html { redirect_to(rawmaterial_categories_url) }
      format.xml  { head :ok }
    end
  end
end
