class GuestChefsController < ApplicationController
  
  def new
    
    @chef = Chef.new
    @chef.recipes.build
    @chef.recipes.first.steps_as_text = <<-STEPS
      1. Write steps with a number and full stop at the front
      2. Add a URL anywhere in a step to make it linkable - but only one per step
      3. Don't go over 140 characters per step - then they can be tweeted
      4. Ensure your steps are 'doable' - that a user can check them off
    STEPS
    
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