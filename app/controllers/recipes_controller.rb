class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end
  
  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    
    @recipe = Recipe.new
    @recipe.steps = "1. List steps with N. format. You can put in anything you like to make your recipe tasty.\n2. Like a <a href='http://google.com'>html link</a>!"
    @recipe.ingredients = "Pop in suggested resources\nOr other recipes that are prerequisites\nOne per line"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(recipes_url) }
      format.xml  { head :ok }
    end
  end
end
