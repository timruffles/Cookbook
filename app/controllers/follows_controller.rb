class FollowsController < ApplicationController
  
  def create
    
    api_operation do
      followable = param[:follow][:type].classify.constantize.find(param[:follow][:id])
      current_user.follow(followable)
    end

  end
  
  def destroy
    
    api_operation do
      followable = param[:follow][:type].classify.constantize.find(param[:follow][:id])
      current_user.stop_following(followable)
    end
    
  end
  
end