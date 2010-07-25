class HomeController < ApplicationController
  
  def index
    
    @featured = Recipe.with_chefs_recipes.first
    
    # render :text => @featured.chef.to_yaml
    
  end
  
end
