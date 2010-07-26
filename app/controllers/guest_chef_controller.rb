class GuestChefController < ApplicationController
  
  def new
    
    @chef = Chef.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    
    @chef = Chef.new(params[:chef])
    
    respond_to do |format|
      if @chef.save
        format.html { redirect_to(@chef, :notice => 'Recipe and chef successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
end