class GuestChefsController < ApplicationController
  
  def new
    
    @chef = Chef.new
    @chef.recipes.build
    
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    
#    return render :text => params[:chef].merge({:email => "guest#{rand(999)}@random.com", :password => 'startupfun', :password_confirmation => 'startupfun'}).inspect
    
    @chef = Chef.new(params[:chef].merge({:email => "guest#{rand(999)}@random.com", :password => 'startupfun', :password_confirmation => 'startupfun'}))
    
    respond_to do |format|
      if @chef.save
        format.html { redirect_to(@chef.recipes.last, :notice => 'Recipe and chef successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
end