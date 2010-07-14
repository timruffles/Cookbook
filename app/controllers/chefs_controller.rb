class ChefsController < ApplicationController
  # GET /chefs
  # GET /chefs.xml
  def index
    @chefs = Chef.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chefs }
    end
  end

  # GET /chefs/1
  # GET /chefs/1.xml
  def show
    @chef = Chef.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chef }
    end
  end

  # GET /chefs/new
  # GET /chefs/new.xml
  def new
    @chef = Chef.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chef }
    end
  end

  # GET /chefs/1/edit
  def edit
    @chef = Chef.find(params[:id])
  end

  # POST /chefs
  # POST /chefs.xml
  def create
    @chef = Chef.new(params[:chef])

    respond_to do |format|
      if @chef.save
        format.html { redirect_to(@chef, :notice => 'Chef was successfully created.') }
        format.xml  { render :xml => @chef, :status => :created, :location => @chef }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chef.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chefs/1
  # PUT /chefs/1.xml
  def update
    @chef = Chef.find(params[:id])

    respond_to do |format|
      if @chef.update_attributes(params[:chef])
        format.html { redirect_to(@chef, :notice => 'Chef was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chef.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chefs/1
  # DELETE /chefs/1.xml
  def destroy
    @chef = Chef.find(params[:id])
    @chef.destroy

    respond_to do |format|
      format.html { redirect_to(chefs_url) }
      format.xml  { head :ok }
    end
  end
end
